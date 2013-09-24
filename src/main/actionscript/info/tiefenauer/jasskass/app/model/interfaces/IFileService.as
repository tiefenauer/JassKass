/**
 * IFileService.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	import flash.filesystem.File;
	
	import org.osflash.signals.Signal;

	public interface IFileService
	{
		function get onDataLodaded():Signal;
		function get onLoadError():Signal;

		function get onDataSaved():Signal;
		function get onSaveError():Signal;
		
		function get file():File;
		function set file(value:File):void;
	}
}