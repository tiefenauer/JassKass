/**
 * TeamBuilderEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	
	/**
	 * Event for TeamBuilder 
	 * @author Daniel Tiefenauer
	 */
	public class TeamBuilderEvent extends Event
	{
		public static const NAME:String = 'TeamBuilderEvent';
		// Event types
		public static const BUILD_TEAM:String = NAME + 'BuildTeam';
		
		public var players:Vector.<IJassPlayer>;
		
		/**
		 * Constructor 
		 * @param type
		 * @param players
		 * @param bubbles
		 * @param cancelable
		 */
		public function TeamBuilderEvent(type:String, players:Vector.<IJassPlayer> = null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.players = players;
		}
	}
}