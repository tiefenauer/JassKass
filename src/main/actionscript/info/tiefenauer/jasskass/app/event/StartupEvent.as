/**
 * StartupEvent.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.event
{
	import flash.events.Event;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	public class StartupEvent extends Event
	{
		public static const NAME:String = 'StartupEvent';
		// Event types
		public static const STARTUP:String = NAME + 'Startup';
		public static const STARTUP_COMPLETE:String = NAME + 'StartupComplete';
		
		public function StartupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}