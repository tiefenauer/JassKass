/**
 * ITextFileService.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	public interface ITextFileService extends IFileService
	{
		function read():String;
		function write(value:String):void;
	}
}