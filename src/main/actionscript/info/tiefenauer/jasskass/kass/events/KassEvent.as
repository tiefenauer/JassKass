package info.tiefenauer.jasskass.kass.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassEvent extends Event
	{
		private static const NAME:String = 'KassEvent';
		// event types
		public static const DOWNLOAD_KASS_DATA:String = NAME + 'DownloadKassData';
		public static const DOWNLOAD_KASS_DATA_START:String = NAME + 'DownloadKassDataStart';
		public static const DOWNLOAD_KASS_DATA_END:String = NAME + 'DownloadKassDataEnd';
		
		public static const SYNC_KASS_DATA:String = NAME + 'SyncKassData';
		public static const SYNC_KASS_DATA_START:String = NAME + 'SyncKassDataStart';
		public static const SYNC_KASS_DATA_END:String = NAME + 'SyncKassDataEnd';
		
		public static const SAVE_KASS_DATA:String = NAME + 'SaveKassData';
		public static const SAVE_KASS_DATA_START:String = NAME + 'SaveKassDataStart';
		public static const SAVE_KASS_DATA_END:String = NAME + 'SaveKassDataEnd';
		
		public var group:IJassGroup;
		public var kass:IKass;
		
		/**
		 * COnstructor 
		 * @param type
		 * @param entries
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function KassEvent(type:String,bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}