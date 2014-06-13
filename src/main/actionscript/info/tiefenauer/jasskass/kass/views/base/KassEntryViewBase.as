/**
 * KassEntryViewBase.as
 *
 * Project: JassKass
 * Date: Jun 11, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.views.base
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * 
	 * @author dtie
	 */
	public class KassEntryViewBase extends MobileView
	{
		private static const NAME:String = 'KassEntryViewBase';
		// event types
		
		
		//-----------------------------
		// Getter/Setter
		//-----------------------------
		[Bindable]
		public function get kassEntry():IKassEntry{
			if (data is IKassEntry)
				return data as IKassEntry;
			return null;
		}
		public function set kassEntry(value:IKassEntry):void{
			data = value;
		}
	}
}