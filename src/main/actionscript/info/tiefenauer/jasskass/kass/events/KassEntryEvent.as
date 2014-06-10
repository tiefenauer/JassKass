/**
 * KassEntryEvent.as
 *
 * Project: JassKass
 * Date: Jun 10, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.events
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * 
	 * @author dtie
	 */
	public class KassEntryEvent extends Event
	{
		private static const NAME:String = 'KassEntryEvent';
		// event types
		public static const SHOW_KASS_ENTRY:String = NAME + 'ShowKassEntry';
		
		public var entry:IKassEntry;
		
		/**
		 * 
		 * @param type
		 * @param entry
		 * @param bubbles
		 * @param cancelable
		 */
		public function KassEntryEvent(type:String, entry:IKassEntry=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.entry = entry;
		}
	}
}