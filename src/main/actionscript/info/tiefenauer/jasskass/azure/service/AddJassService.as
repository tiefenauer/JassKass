package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.factory.JassFactory;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;

	public class AddJassService extends AzureService
	{
		/**
		 * 
		 */
		public function AddJassService(){
			super('addjass');
			onSuccess = new Signal(IJass);
			_completeHandler = onJassAdded;
		}
		
		public function addJass(jass:IJass, group:IJassGroup):void{
			_body = {
				jass: JassFactory.toAzureObject(jass),
				group: JassGroupFactory.toObject(group)
			};
			POST();
		}
		
		private function onJassAdded(event:Event):void{
			try{
				var responseObj:Object = JSON.parse(urlLoader.data);
				var jass:IJass = JassFactory.fromAzureObject(responseObj);
				onSuccess.dispatch(jass);
			}
			catch(error:Error){
				onError.dispatch(error);
			}
		}
	}
}