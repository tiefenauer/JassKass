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
		private static const NAME:String = 'JassGameEvent';
		// event types
		public static const NEW_GAME:String = NAME + 'NewGame';
		
		public var factor:Number;
		
		/**
		 * Constructor 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 */
		public function JassGameEvent(type:String, factor:Number=1, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.factor = factor;
		}
	}
}