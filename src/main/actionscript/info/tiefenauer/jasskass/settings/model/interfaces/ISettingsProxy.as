/**
 * ISettingsProxy.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.model.interfaces
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.model.interfaces
{
	

	/**
	 * 
	 * @author dtie
	 */
	public interface ISettingsProxy
	{
		function get settings():Vector.<ISetting>;
		
		function addSetting(value:ISetting):void;
		function getSettingByKey(value:String):ISetting;
	}
}