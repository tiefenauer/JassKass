/**
 * ISpreadsheetLink.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IXML;

	public interface ISpreadsheetLink extends IXML
	{
		function get rel():String;
		function set rel(value:String):void;
		
		function get type():String;
		function set type(value:String):void;
		
		function get href():String;
		function set href(value:String):void;
	}
}