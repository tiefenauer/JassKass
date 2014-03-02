package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class AzurePlayerEvent extends Event
	{
		private static const NAME:String = 'AzurePlayerEvent';
		// event types
		public static const CREATE_PLAYER:String = NAME + 'createPlayer';
		public static const PLAYER_CREATED:String = NAME + 'playerCreated';
		
		public var player:IJassPlayer;
		
		public function AzurePlayerEvent(type:String, player:IJassPlayer=null,bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.player = player;
		}
	}
}