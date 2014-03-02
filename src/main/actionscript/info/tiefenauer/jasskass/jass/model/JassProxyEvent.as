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
		
		public static const JASSES_CHANGED:String = NAME + 'JassesChanged';
		
		public static const CURRENT_GAME_CHANGED:String = NAME + 'CurrentGameChanged';
		public static const CURRENT_STRICHE_CHANGED:String = NAME + 'CurrentStricheChanged';
		
		public static const SAVE_JASSES_TO_FILE:String = NAME + 'SaveJassesToFile';
		public static const SAVE_JASSES_TO_SERVER:String = NAME + 'SaveJassesToServer';
		
		public static const LOAD_JASSES_FROM_FILE:String = NAME + 'LoadJassesFromFile';
		public static const LOAD_JASSES_FROM_SERVER:String = NAME + 'LoadJassesFromServer';
		
		public static const SYNC_JASSES:String = NAME + 'SyncJasses';
		
		public function JassProxyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}