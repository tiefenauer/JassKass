/**
 * ISpreadsheetContent.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IXML;

	public interface ISpreadsheetContent extends IXML
	{
		function get type():String;
		function set type(value:String):void;
			
		function get src():String;
		function set src(value:String):void;
	}
}