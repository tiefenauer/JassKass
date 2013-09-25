/**
 * BootstrapModels.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import com.adobe.protocols.oauth2.OAuth2;
	
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.TextFileService;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.app.model.vo.ConfigFile;
	
	import org.as3commons.logging.setup.LogSetupLevel;
	
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * Bootstrap models/objects 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class BootstrapModels extends SimpleCommand
	{
		[Inject]
		public var injector:IInjector;
		
		override public function execute():void{
			super.execute();
			
			// proxies
			injector.map(IConfigProxy).toSingleton(ConfigProxy);
			
			// Services
			injector.map(ITextFileService).toType(TextFileService);
			
			// VOs
			injector.map(ConfigFile).toValue(new ConfigFile(File.applicationDirectory.resolvePath('config.xml').nativePath));
			
			// authorization
			injector.map(OAuth2).toValue(new OAuth2("https://accounts.google.com/o/oauth2/auth", "https://accounts.google.com/o/oauth2/token", LogSetupLevel.ALL));
		}
	}
}