/**
 * PointsEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	/**
	 * Event class for JassPoints 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class PointsEvent extends Event
	{
		public static const NAME:String = 'PointsEvent';
		//event types
		public static const ADD_POINTS:String = NAME + 'AddPoints';
		
		public var factor:Number;
		public var team1Points:Number;
		public var team2Points:Number;
		
		/**
		 * Constructor 
		 * @param type
		 * @param team1Points
		 * @param team2Points
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function PointsEvent(type:String, team1Points:Number=0, team2Points:Number=0, factor=1, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.team1Points = team1Points;
			this.team2Points = team2Points;
			this.factor = factor;
		}
	}
}