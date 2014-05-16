package info.tiefenauer.jasskass.kass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.azure.service.KassService;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	
	/**
	 * JassKass-Daten von Drive herunterladen 
	 * @author Daniel
	 */
	public class DownloadKassData extends SimpleCommand
	{
		[Inject] public var event:KassEvent;
		[Inject] public var service:KassService;
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			service.onSuccess.addOnce(onKassDownloaded);
			detain();
			service.getKass(event.group);
		}
		
		/**
		 * 
		 * @param kass
		 */
		private function onKassDownloaded(kass:IKass):void{
			release();
			var downloadedEvent:KassEvent = new KassEvent(KassEvent.DOWNLOAD_KASS_DATA_END);
			downloadedEvent.group = event.group;
			downloadedEvent.kass = kass;
			dispatch(downloadedEvent);
		}
		
	}
}