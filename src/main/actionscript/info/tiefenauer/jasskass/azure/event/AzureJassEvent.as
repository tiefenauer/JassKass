package info.tiefenauer.jasskass.azure.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	/**
	 * 
	 * @author Daniel
	 * 
	 */
	public class AzureJassEvent extends Event
	{
		private static const NAME:String = 'AzureJassEvent';
		// event types
		public static const ADD_JASS:String = NAME + 'AddJass';
		public static const JASS_ADDED:String = NAME + 'JassAdded';
		public static const READ_JASS:String = NAME + 'ReadJass';
		public static const JASS_REAAD:String = NAME + 'JassRead';
		public static const UPDATE_JASS:String = NAME + 'UpdateJass';
		public static const JASS_UPDATED:String = NAME + 'JassUpdated';
		public static const DELETE_JASS:String = NAME + 'DeleteJass';
		public static const JASS_DELETED:String = NAME + 'JassDeleted';
		
		public var jass:IJass;
		
		/**
		 * 
		 * @param type
		 * @param jass
		 * @param bubbles
		 * @param cancelable
		 * 
		 */
		public function AzureJassEvent(type:String, jass:IJass=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.jass = jass;
		}
	}
}