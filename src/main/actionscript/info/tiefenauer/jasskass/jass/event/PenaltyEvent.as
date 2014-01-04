/**
 * BergpreisEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	
	/**
	 * Event class for Bergpreis 
	 * @author Daniel Tiefenauer
	 */
	public class PenaltyEvent extends Event
	{
		public static const NAME:String = 'PenaltyEvent';
		// event types
		public static const BERGPREIS:String = NAME + 'Bergpreis';
		public static const SIEG:String = NAME + 'Sieg';
		public static const MATCH:String = NAME + 'Match';
		public static const KONTERMATCH:String = NAME + 'KonterMatch';
		public static const VIER_BAUERN:String = NAME + 'Vier Bauern';
		
		public var team:IJassTeam;
		
		/**
		 * COnstructor 
		 * @param type
		 * @param team
		 * @param bubbles
		 * @param cancelable
		 */
		public function PenaltyEvent(type:String, team:IJassTeam, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.team = team;
		}
	}
}