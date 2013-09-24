/**
 * ConfigProxy.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model
{
	
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfiguration;
	
	/**
	 * Proxy to maintain app configuration 
	 * @author Daniel Tiefenauer
	 */
	public class ConfigProxy implements IConfigProxy
	{
		private var _configs:Vector.<IConfiguration> = new Vector.<IConfiguration>();
		
		//-------------------------------
		// public methods
		//-------------------------------
		/**
		 * Add a configuration to existing set. Previous configurations with same key will be overridden. 
		 * @param value
		 */
		public function addConfiguration(value:IConfiguration):void{
			var conf:IConfiguration = getConfigurationByKey(value.key);
			if (conf)
				_configs.splice(_configs.indexOf(conf), 1, value);
			else
				_configs.push(value);
		}
		
		/**
		 * Get a configuration by its key 
		 * @param value
		 * @return 
		 */
		public function getConfigurationByKey(value:String):IConfiguration{
			var filterByKey:Function = function(item:IConfiguration, index:int, vector:Vector.<IConfiguration>):Boolean{
				return item.key == value;
			}
			var results:Vector.<IConfiguration> = _configs.filter(filterByKey);
			if (results.length > 0)
				return results[0];
			return null;
		}
	}
}