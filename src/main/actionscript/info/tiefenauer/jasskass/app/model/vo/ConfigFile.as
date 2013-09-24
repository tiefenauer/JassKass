/**
 * ConfigFile.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.vo
{
	import flash.filesystem.File;
	
	/**
	 * Config file for injection
	 * @author Daniel Tiefenauer
	 */
	public class ConfigFile extends File
	{
		public function ConfigFile(path:String=null){
			super(path);
			if (path && !this.exists)
				throw new Error('Config File does not exist!');
		}
	}
}