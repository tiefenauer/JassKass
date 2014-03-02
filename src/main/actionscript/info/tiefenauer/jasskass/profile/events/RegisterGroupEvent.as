package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	public class RegisterGroupEvent extends Event
	{
		private static const NAME:String = 'RegisterGroupEvent';
		// event types
		public static const REGISTER_GROUP:String = NAME + 'RegisterGroup';
		public static const GROUP_REGISTERED:String = NAME + 'GroupRegistered';
		
		public var code:String;
		
		/**
		 * Constructor 
		 * @param type
		 * @param code
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function RegisterGroupEvent(type:String, code:String=null,bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.code = code;
		}
	}
}