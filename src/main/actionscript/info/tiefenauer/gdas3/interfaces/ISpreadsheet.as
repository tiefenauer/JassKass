/**
 * ISpreadsheet.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IXML;

	public interface ISpreadsheet extends IXML
	{
		function get id():String;
		function set id(value:String):void;
		
		function get etag():String;
		function set etag(value:String):void;
		
		function get updated():Date;
		function set updated(value:Date):void;
		
		function get author():ISpreadsheetAuthor;
		function set author(value:ISpreadsheetAuthor):void;
		
		function get category():ISpreadsheetCategory;
		function set category(value:ISpreadsheetCategory):void;
		
		function get title():String;
		function set title(value:String):void;
		
		function get content():ISpreadsheetContent;
		function set content(value:ISpreadsheetContent):void;
		
		function get links():Vector.<ISpreadsheetLink>;
	}
}