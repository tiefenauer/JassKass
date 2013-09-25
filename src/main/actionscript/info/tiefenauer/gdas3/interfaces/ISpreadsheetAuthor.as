/**
 * ISpreadsheetAuthor.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IXML;

	public interface ISpreadsheetAuthor extends IXML
	{
		function get name():String;
		function set name(value:String):void;
		
		function get email():String;
		function set email(value:String):void;
	}
}