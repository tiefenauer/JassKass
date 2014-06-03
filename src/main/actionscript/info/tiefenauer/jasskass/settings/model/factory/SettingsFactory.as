/**
 * SettingsFactory.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.model.factory
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.model.factory
{
	import info.tiefenauer.jasskass.settings.model.Setting;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;

	/**
	 * 
	 * @author dtie
	 */
	public class SettingsFactory
	{
		
		/**
		 * ISetting ==> Object
		 * @param setting
		 */
		public static function toObject(setting:ISetting):Object{
			return {
				key: setting.key,
				value: setting.value
			}
		}
		
		/**
		 * Object ==> ISetting 
		 * @param obj
		 */
		public static function fromObject(obj:Object):ISetting{
			var setting:ISetting = new Setting();
			for (var key:String in obj) switch(key){
				case 'key':
					setting.key = obj[key];
					break;
				case 'value':
					setting.value = obj[key];
					break;
			}
			return setting;
		}
	}
}