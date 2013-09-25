/**
 * ISpreadsheetCategory.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IXML;

	public interface ISpreadsheetCategory extends IXML
	{
		function get scheme():String;
		function set scheme(value:String):void;
		function get term():String;
		function set term(value:String):void;
	}
}