package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;

	public class AddGroupService extends AzureService
	{
		public function AddGroupService(){
			super('addgroup');
			_completeHandler = onGroupAdded;
			onSuccess = new Signal(IJassGroup);
		}
		
		public function addGroup(group:IJassGroup):void{
			_body = JassGroupFactory.toObject(group);
			POST();
		}
		
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