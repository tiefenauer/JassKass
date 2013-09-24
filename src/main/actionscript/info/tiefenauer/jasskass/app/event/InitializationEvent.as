package info.tiefenauer.jasskass.app.event
{
	import flash.events.Event;
	
	/**
	 * Event for app initialization 
	 * @author Daniel Tiefenauer
	 */
	public class InitializationEvent extends Event
	{
		public static const NAME:String = 'InitializationEvent';
		// event types
		public static const LOAD_APP_CONFIG:String = NAME + 'LoadAppConfig';
		public static const GET_GOOGLE_API_TOKEN:String = NAME + 'GetGoogleApiToken';
		
		/**
		 * Constructor 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function InitializationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new InitializationEvent(type, bubbles, cancelable);
		}
	}
}