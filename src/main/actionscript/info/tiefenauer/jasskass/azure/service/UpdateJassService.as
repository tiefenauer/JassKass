package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	import org.osflash.signals.Signal;

	public class UpdateJassService extends AzureService
	{
		/**
		 * 
		 */
		public function UpdateJassService(){
			super('updatejass');
			onSuccess = new Signal(IJass);
			_completeHandler = onJassUpdated;
		}
		
		public function updateJass(jass:IJass):void{
			
		}
		
		private function onJassUpdated(event:Event):void{
			
		}
	}
}