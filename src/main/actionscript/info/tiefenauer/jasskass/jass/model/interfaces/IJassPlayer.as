/**
 * IPerson.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IJSON;

	[Bindable]
	public interface IJassPlayer extends IJSON
	{
		function get firstName():String;
		function set firstName(value:String):void;
		
		function get lastName():String;
		function set lastName(value:String):void;
		
		function get eMail():String;
		function set eMail(value:String):void;
	}
}