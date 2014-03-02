package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	public class JassGroupProxyEvent extends Event
	{
		private static const NAME:String = 'JassGroupProxyEvent';
		// event types
		public static const SAVE_JASS_GROUPS_TO_FILE:String = NAME + 'SaveJassGroupsToFile';
		public static const LOAD_JASS_GROUPS_FROM_FILE:String = NAME + 'LoadJassGroupFromFile';
		
		public static const LEAVE_CURRENT_GROUP:String = NAME + 'LeaveCurrentGroup';
		
		public static const SYNC_GROUPS:String = NAME + 'SyncCurrentGroup';
		
		public function JassGroupProxyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}