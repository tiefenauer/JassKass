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
		public static const FINISH_JASS:String = NAME + 'FinishJass';
		public static const SHOW_PENALTY:String = NAME + 'ShowPenalty';
		public static const HIDE_PENALTY:String = NAME + 'HidePenalty';
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