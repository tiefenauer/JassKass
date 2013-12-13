/**
 * JassGameEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	/**
	 * Event class for JassGame 
	 * @author Daniel Tiefenauer
	 */
	public class JassGameEvent extends Event
	{
		public static const NAME:String = 'JassGameEvent';
		// event types
		
		
		/**
		 * Constructor 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 */
		public function JassGameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}