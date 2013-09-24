/**
 * IConfigProxy.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	public interface IConfigProxy
	{
		function addConfiguration(value:IConfiguration):void;
		function getConfigurationByKey(value:String):IConfiguration;
	}
}