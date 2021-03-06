/**
 * SaveSettings.as
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
	 * Save Settings 
	 * @author dtie
	 */
	public class SaveSettings extends SimpleCommand
	{
		[Inject] public var settings:Vector.<ISetting>;
		[Inject] public var settingsProxy:ISettingsProxy;
		[Inject] public var fileService:ITextFileService;
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			var settingsArr:Array = [];
			for each(var setting:ISetting in settings){
				settingsProxy.addSetting(setting);
				settingsArr.push(SettingsFactory.toObject(setting));
			};
			fileService.file = File.applicationStorageDirectory.resolvePath('settings.json');
			fileService.write(JSON.stringify(settingsArr));
		}
			
	}
}