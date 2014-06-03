/**
 * StartupCommand.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.settings.signals.LoadSettingsSignal;
	
	/**
	 * Startup/initialize app 
	 * @author Daniel Tiefenauer
	 */
	public class StartupCommand extends SimpleCommand
	{
		[Inject] public var loadSettingsSignal:LoadSettingsSignal;
		
		override public function execute():void{
			super.execute();
			loadSettingsSignal.dispatch(File.applicationStorageDirectory.resolvePath('settings.json'));
			dispatch(new InitializationEvent(InitializationEvent.LOAD_APP_CONFIG));
			
			dispatch(new JassProxyEvent(JassProxyEvent.LOAD_JASSES_FROM_FILE));
			dispatch(new JassGroupProxyEvent(JassGroupProxyEvent.LOAD_JASS_GROUPS_FROM_FILE));
			
			dispatch(new JassProxyEvent(JassProxyEvent.SYNC_JASSES));
		}
	}
}