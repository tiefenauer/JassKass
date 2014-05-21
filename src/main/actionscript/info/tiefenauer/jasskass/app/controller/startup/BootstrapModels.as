/**
 * BootstrapModels.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import com.adobe.protocols.oauth2.OAuth2;
	
	import mx.core.FlexGlobals;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.TextFileService;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.azure.service.GroupService;
	import info.tiefenauer.jasskass.azure.service.JassService;
	import info.tiefenauer.jasskass.azure.service.KassService;
	import info.tiefenauer.jasskass.jass.model.JassProxy;
	import info.tiefenauer.jasskass.jass.model.JassTeamProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeamProxy;
	import info.tiefenauer.jasskass.kass.model.KassProxy;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	import info.tiefenauer.jasskass.profile.model.JassGroupProxy;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
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
			injector.map(IJassTeamProxy).toSingleton(JassTeamProxy);
			injector.map(IJassProxy).toSingleton(JassProxy);
			injector.map(IJassGroupProxy).toSingleton(JassGroupProxy);
			injector.map(IKassProxy).toSingleton(KassProxy);
			
			// Services
			injector.map(ITextFileService).toType(TextFileService);
			injector.map(JassService).toType(JassService);
			injector.map(GroupService).toType(GroupService);
			injector.map(KassService).toType(KassService);
			
			// authorization
			injector.map(OAuth2).toValue(new OAuth2("https://accounts.google.com/o/oauth2/auth", "https://accounts.google.com/o/oauth2/token", LogSetupLevel.ALL));
			
			// other
			injector.map(JassKass).toValue(FlexGlobals.topLevelApplication);
		}
	}
}