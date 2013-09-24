/**
 * LoadAppConfiguration.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	import info.tiefenauer.jasskass.app.model.vo.ConfigFile;
	
	/**
	 * Load app configuration from file 
	 * @author Daniel Tiefenauer
	 */
	public class LoadAppConfiguration extends SimpleCommand
	{
		[Inject] public var fileService:ITextFileService;
		[Inject] public var configProxy:IConfigProxy;
		[Inject] public var configFile:ConfigFile;
		
		override public function execute():void{
			super.execute();
			fileService.file = configFile;
			var configs:XML = XML(fileService.read());
			for each(var node:XML in configs.children()){
				var appConfig:AppConfiguration = new AppConfiguration();
				appConfig.fromXML(node);
				configProxy.addConfiguration(appConfig);
			}
		}
	}
}