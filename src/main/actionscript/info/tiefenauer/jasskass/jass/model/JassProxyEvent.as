/**
 * JassProxyEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model
{
	import flash.events.Event;
	
	/**
	 * Event class for JassProxy 
	 * @author Daniel Tiefenauer
	 */
	public class JassProxyEvent extends Event
	{
		public static const NAME:String = 'JassProxyEvent';
		// event types
		public static const NEW_GAME:String = NAME + 'NewGame';
		
		public static const CURRENT_GAME_CHANGED:String = NAME + 'CurrentGameChanged';
		public static const CURRENT_STRICHE_CHANGED:String = NAME + 'CurrentStricheChanged';
		
		public static const SAVE_JASSES:String = NAME + 'SaveJasses';
		public static const LOAD_JASSES:String = NAME + 'LoadJasses';
		
		public function JassProxyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}