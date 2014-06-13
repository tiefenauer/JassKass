/**
 * LoadSettings.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.controller
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.settings.model.factory.SettingsFactory;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISettingsProxy;
	
	/**
	 * Load Settings from File
	 * @author dtie
	 */
	public class LoadSettings extends SimpleCommand
	{
		[Inject] public var fileService:ITextFileService;
		[Inject] public var settingsProxy:ISettingsProxy;
		
		private var defaultSettingsFile:File = File.applicationDirectory.resolvePath('defaultSettings.json');
		private var settingsFile:File = File.applicationStorageDirectory.resolvePath('settings.json');
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			if (!settingsFile.exists)
				defaultSettingsFile.copyTo(settingsFile);
			fileService.file = settingsFile;
			var settingsArr:Array = JSON.parse(fileService.read()) as Array;
			for each(var settingsObj:Object in settingsArr){
				var setting:ISetting = SettingsFactory.fromObject(settingsObj);
				settingsProxy.addSetting(setting);
			}
		}
	}
}