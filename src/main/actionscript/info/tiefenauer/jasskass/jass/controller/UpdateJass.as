package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.azure.event.AzureJassEvent;
	import info.tiefenauer.jasskass.azure.service.JassService;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class UpdateJass extends SimpleCommand
	{
		[Inject] public var event:AzureJassEvent;
		[Inject] public var service:JassService;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		/**
		 * 
		 * 
		 */
		override public function execute():void{
			super.execute();
			detain();
			service.onSuccess.addOnce(onJassUpdated);
			service.addJass(event.jass, jassGroupProxy.currentJassGroup);
		}
		
		/**
		 * 
		 * @param jass
		 */
		private function onJassUpdated(jass:IJass):void{
			release();
			dispatch(new AzureJassEvent(AzureJassEvent.JASS_UPDATED, jass));
		}
	}
}