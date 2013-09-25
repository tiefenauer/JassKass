/**
 * IPerson.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.counter.model.interfaces
{
	public interface IPerson
	{
		function get firstName():String;
		function set firstName(value:String):void;
		
		function get lastName():String;
		function set lastName(value:String):void;
		
		function get eMail():String;
		function set eMail(value:String):void;
	}
}