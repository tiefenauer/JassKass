/**
 * StartupCommand.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	
	/**
	 * Startup/initialize app 
	 * @author Daniel Tiefenauer
	 */
	public class StartupCommand extends SimpleCommand
	{
		override public function execute():void{
			super.execute();
			dispatch(new InitializationEvent(InitializationEvent.LOAD_APP_CONFIG));
			dispatch(new InitializationEvent(InitializationEvent.GET_GOOGLE_API_TOKEN));
		}
	}
}