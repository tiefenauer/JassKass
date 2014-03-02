/**
 * LoadAppConfiguration.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	
	/**
	 * Load app configuration from file 
	 * @author Daniel Tiefenauer
	 */
	public class LoadAppConfiguration extends SimpleCommand
	{
		[Inject] public var fileService:ITextFileService;
		[Inject] public var configProxy:IConfigProxy;
		
		override public function execute():void{
			super.execute();
			fileService.file = File.applicationDirectory.resolvePath('config.xml');
			var configs:XML = XML(fileService.read());
			for each(var node:XML in configs.children()){
				var appConfig:AppConfiguration = new AppConfiguration();
				appConfig.fromXML(node);
				configProxy.addConfiguration(appConfig);
			}
		}
	}
}