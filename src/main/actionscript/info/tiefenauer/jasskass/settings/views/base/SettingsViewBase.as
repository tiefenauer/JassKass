/**
 * SettingsViewBase.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.views.base
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	
	/**
	 * Base class for Setting Views
	 * @author dtie
	 */
	public class SettingsViewBase extends MobileView
	{
		private static const NAME:String = 'SettingsViewBase';
		// event types
		public static const SAVE_SETTINGS_CLICKED:String = NAME + 'SaveSettingsClicked';
		/**
		 * 
		 * 
		 */
		public function SettingsViewBase(){
			super();
			data = new Vector.<ISetting>();
		}
		

		//--------------------------------
		// Getter/Setter
		//--------------------------------
		[Bindable]
		public function get settings():Vector.<ISetting>{
			if (data is Vector.<ISetting>)
				return data as Vector.<ISetting>;
			return null;
		}
		public function set settings(value:Vector.<ISetting>):void{
			data = value;
		}
	}
}