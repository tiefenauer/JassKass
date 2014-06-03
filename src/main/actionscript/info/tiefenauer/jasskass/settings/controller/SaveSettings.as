/**
 * SaveSettings.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	
	/**
	 * Save Settings 
	 * @author dtie
	 */
	public class SaveSettings extends SimpleCommand
	{
		[Inject] public var settings:Vector.<ISetting>;
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
		}
			
	}
}