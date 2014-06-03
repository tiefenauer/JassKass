/**
 * SaveSettingsSignal.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.signals
{
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal to save Settings 
	 * @author dtie
	 */
	public class SaveSettingsSignal extends Signal
	{
		/**
		 * 
		 * 
		 */
		public function SaveSettingsSignal(){
			super(Vector.<ISetting>);
		}
	}
}