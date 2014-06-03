/**
 * LoadSettingsSignal.as
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
	import flash.filesystem.File;
	
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class LoadSettingsSignal extends Signal
	{
		/**
		 * 
		 * 
		 */
		public function LoadSettingsSignal(){
			super(File);
		}
	}
}