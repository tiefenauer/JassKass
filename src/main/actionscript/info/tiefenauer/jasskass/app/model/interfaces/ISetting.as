/**
 * ISetting.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	public interface ISetting extends IXML
	{
		function get key():String;
		function set key(value:String):void;
		
		function get value():String;
		function set value(value:String):void;
	}
}