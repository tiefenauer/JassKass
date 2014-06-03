/**
 * SettingProxy.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.settings.model
{
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISettingsProxy;
	
	/**
	 * Proxy to maintain changing settings 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class SettingProxy implements ISettingsProxy
	{
		private var _settings:Vector.<ISetting> = new Vector.<ISetting>();

		//-------------------------------
		// public methods
		//-------------------------------
		/**
		 * Get a configuration by its key 
		 * @param value
		 * @return 
		 */
		public function getSettingByKey(value:String):ISetting{
			var filterByKey:Function = function(item:ISetting, index:int, vector:Vector.<ISetting>):Boolean{
				return item.key == value;
			}
			var results:Vector.<ISetting> = _settings.filter(filterByKey);
			if (results.length > 0)
				return results[0];
			return null;
		}
		
		/**
		 * Add a configuration to existing set. Previous configurations with same key will be overridden. 
		 * @param value
		 */
		public function addSetting(value:ISetting):void{
			var conf:ISetting = getSettingByKey(value.key);
			if (conf)
				_settings.splice(_settings.indexOf(conf), 1, value);
			else
				_settings.push(value);
		}
		
		//-----------------------
		// Getter/Setter
		//-----------------------
		public function get settings():Vector.<ISetting>{
			return _settings;
		}
	}
}