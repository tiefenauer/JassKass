package info.tiefenauer.jasskass.profile.controller
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.profile.events.AzurePlayerEvent;
	
	/**
	 * Create JassPlayer 
	 * @author Daniel
	 */
	public class CreateJassPlayer extends SimpleCommand
	{
		[Inject] public var event:AzurePlayerEvent;
		
		private var loader:URLLoader = new URLLoader();
		
		override public function execute():void{
			super.execute();

			var request:URLRequest = new URLRequest('https://jaskass.azure-mobile.net/tables/Players');
			request.method = URLRequestMethod.POST;
			request.requestHeaders = [
				new URLRequestHeader('Content-Type', 'application/json'),
				new URLRequestHeader('Accept', 'application/json')
			];
			request.data = JSON.stringify({
				"first": event.player.firstName,
				"last": event.player.lastName,
				"email": event.player.eMail
			});
			
			loader.addEventListener(Event.COMPLETE, onLoaderResponse);
			loader.load(request);
		}
		
		private function onLoaderResponse(responseEvent:Event):void{
			trace('player saved: ' + loader.data);
			try{
				var responseObj:Object = JSON.parse(loader.data);
				event.player.id = responseObj['id'];
				dispatch(new AzurePlayerEvent(AzurePlayerEvent.PLAYER_CREATED, event.player));
			}
			catch(error:Error){
				trace('something went wrong connecting to Azure');
			}
		}
	}
}