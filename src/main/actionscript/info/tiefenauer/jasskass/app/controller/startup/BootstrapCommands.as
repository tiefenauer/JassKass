package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	/**
	 * Bootstrap events/commands 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class BootstrapCommands extends SimpleCommand
	{
		[Inject] public var commandMap:IEventCommandMap;
		
		override public function execute():void{
			super.execute();
			
			// Initialization
			commandMap.map(InitializationEvent.LOAD_APP_CONFIG).toCommand(LoadAppConfiguration);
			commandMap.map(InitializationEvent.GET_GOOGLE_API_TOKEN).toCommand(GetOAuth2AccessToken);
		}
	}
}