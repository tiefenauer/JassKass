package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class AzureGroupEvent extends Event
	{
		private static const NAME:String = 'AzureTeamEvent';
		// event types
		public static const ADD_GROUP:String = NAME + 'AddGroup';
		public static const GROUP_ADDED:String = NAME + 'GroupAdded';
		
		public var group:IJassGroup;
		
		/**
		 * Constructor 
		 * @param type
		 * @param group
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function AzureGroupEvent(type:String, group:IJassGroup=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.group = group;
		}
	}
}