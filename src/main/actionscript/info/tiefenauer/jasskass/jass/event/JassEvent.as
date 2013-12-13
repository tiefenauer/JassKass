/**
 * JassEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	/**
	 * Event class for Jasses 
	 * @author Daniel Tiefenauer
	 */
	public class JassEvent extends Event
	{
		public static const NAME:String = 'JassEvent';
		// Event types
		public static const NEW_JASS:String = NAME + 'NewJass';
		public static const CREATE_JASS:String = NAME + 'CreateJass';
		public static const START_JASS:String = NAME + 'StartJass';
		public static const SHOW_SCORE:String = NAME + 'ShowScore';
		public static const HIDE_SCORE:String = NAME + 'HideScore';
		public static const SHOW_JASS_DETAIL:String = NAME + 'ShowJassDetail';
		
		public var jass:IJass;
		
		/**
		 * Construcotr 
		 * @param type
		 * @param jass
		 * @param bubbles
		 * @param cancelable
		 */
		public function JassEvent(type:String, jass:IJass=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.jass = jass;
		}
	}
}