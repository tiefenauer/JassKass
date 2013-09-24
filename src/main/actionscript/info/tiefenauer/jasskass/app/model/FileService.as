/**
 * FileService.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.model.interfaces.IFileService;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Base class for file services 
	 * @author Daniel Tiefenauer
	 */
	public class FileService implements IFileService
	{
		// Signals
		public var _onDataLoaded:Signal = new Signal(Object);
		public var _onLoadError:Signal = new Signal(Error);
		public var _onDataSaved:Signal = new Signal();
		public var _onSaveError:Signal = new Signal(Error);
		
		protected var _file:File;
		
		/**
		 * Constructor 
		 * @param file
		 * 
		 */
		public function FileService(file:File=null){
			_file = file;
		}

		//-----------------------------------------
		// Getter/Setter
		//-----------------------------------------
		public function get onDataLodaded():Signal{
			return _onDataLoaded;
		}
		public function get onLoadError():Signal{
			return _onLoadError;
		}
		public function get onDataSaved():Signal{
			return _onDataSaved;
		}
		public function get onSaveError():Signal{
			return _onSaveError;
		}
		public function get file():File{
			return _file;
		}
		public function set file(value:File):void{
			_file = value;
		}
	}
}