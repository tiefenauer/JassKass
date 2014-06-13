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
	public class GroupService extends AzureService
	{
		/**
		 * 
		 * @param endpoint
		 */
		public function GroupService(){
			super('getgroup');
			onSuccess = new Signal(IJassGroup);
		}
		
		
		/**
		 * 
		 * @param code
		 */
		public function joinGroup(code:String):void{
			_endpoint = 'getgroup?code=' + code;
			_completeHandler = onGroupJoined;
			GET();
		}
		
		/**
		 * 
		 * @param group
		 */
		public function addGroup(group:IJassGroup):void{
			_endpoint = 'addgroup';
			_completeHandler = onGroupAdded;
			_body = JassGroupFactory.toAzureObject(group);
			POST();
		}
		
		/**
		 * Request completed 
		 * @param event
		 * 
		 */
		private function onGroupJoined(event:Event):void{
			try{
				var responseObj:Object = JSON.parse(urlLoader.data);
				var group:IJassGroup = JassGroupFactory.fromObject(responseObj);
				onSuccess.dispatch(group);
			}
			catch(error:Error){
				onError.dispatch(error);
			}
		}
		
		/**
		 * 
		 * @param event
		 */
		private function onGroupAdded(event:Event):void{
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