/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IJSON;

	public interface IWys extends IJSON
	{
		function get type():String;
		function set type(value:String):void;
		
		function get value():Number;
		function set value(val:Number):void;
		
	}
}