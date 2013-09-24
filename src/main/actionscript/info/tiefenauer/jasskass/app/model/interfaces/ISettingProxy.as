/**
 * ISettingsProxy.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	public interface ISettingProxy
	{
		function getSettingByKey(value:String):ISetting;
		function addSetting(value:ISetting):void;
	}
}