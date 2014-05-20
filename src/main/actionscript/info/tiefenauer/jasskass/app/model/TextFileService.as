/**
 * TextFileService.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	
	/**
	 * Base class for text file services 
	 * @author Daniel Tiefenauer
	 */
	public class TextFileService extends FileService implements ITextFileService
	{
		/**
		 * Constructor 
		 * @param file
		 */
		public function TextFileService(file:File=null){
			super(file);
		}
		
		/**
		 * Read text from file 
		 * @return 
		 * 
		 */
		public function read():String{
			var contents:String = null;
			if (!_file)
				throw new Error("No file specified!");
			if (!_file.exists)
				throw new Error("File does not exist!");
			if (_file.isDirectory)
				throw new Error("Can't read from directory!");
			
			var stream:FileStream = new FileStream();
			stream.open(_file, FileMode.READ);
			contents = stream.readUTFBytes(stream.bytesAvailable);
			stream.close();
			return contents;
		}
		
		/**
		 * Write text to file 
		 * @param value
		 */
		public function write(value:String):void{
			if (!_file)
				throw new Error("No file specified!");
			if (_file.isDirectory)
				throw new Error("Can't write to directory");
				
			var stream:FileStream = new FileStream();
			stream.open(_file, FileMode.WRITE);	
			stream.writeUTFBytes(value);
			stream.close();
		}
	}
}