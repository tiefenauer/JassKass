package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	public class JoinGroupEvent extends Event
	{
		private static const NAME:String = 'RegisterGroupEvent';
		// event types
		public static const JOIN_GROUP:String = NAME + 'JoinGroup';
		public static const GROUP_JOINED:String = NAME + 'GroupJoined';
		public static const GROUP_NOT_FOUND:String = NAME + 'GroupNotFound';
		
		public var code:String;
		
		/**
		 * Constructor 
		 * @param type
		 * @param code
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function JoinGroupEvent(type:String, code:String=null,bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.code = code;
		}
	}
}