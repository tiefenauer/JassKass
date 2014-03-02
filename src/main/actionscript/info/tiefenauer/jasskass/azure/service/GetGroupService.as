package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;

	/**
	 * Azure Service für getgroup 
	 * @author Daniel
	 */
	public class GetGroupService extends AzureService
	{
		/**
		 * 
		 * @param endpoint
		 */
		public function GetGroupService(){
			super('getgroup');
			onSuccess = new Signal(IJassGroup);
			_completeHandler = onGroupReceived;
		}
		
		
		/**
		 * 
		 * @param code
		 */
		public function registerGroup(code:String):void{
			_endpoint += '?code=' + code;
			GET();
		}
		
		/**
		 * Request completed 
		 * @param event
		 * 
		 */
		private function onGroupReceived(event:Event):void{
			try{
				var responseObj:Object = JSON.parse(urlLoader.data);
				var group:IJassGroup = JassGroupFactory.fromObject(responseObj);
				onSuccess.dispatch(group);
			}
			catch(error:Error){
				onError.dispatch(error);
			}
		}
	}
}