package info.tiefenauer.jasskass.kass.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	public class KassEvent extends Event
	{
		private static const NAME:String = 'KassEvent';
		// event types
		public static const DOWNLOAD_KASS_DATA:String = NAME + 'DownloadKassData';
		public static const DOWNLOAD_KASS_DATA_START:String = NAME + 'DownloadKassDataStart';
		public static const DOWNLOAD_KASS_DATA_END:String = NAME + 'DownloadKassDataEnd';
		
		public var entries:Vector.<IKassEntry>;
		
		/**
		 * COnstructor 
		 * @param type
		 * @param entries
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function KassEvent(type:String, entries:Vector.<IKassEntry>=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.entries = entries;
		}
	}
}