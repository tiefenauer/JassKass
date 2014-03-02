package info.tiefenauer.jasskass.profile.events
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class JassGroupEvent extends Event
	{
		private static const NAME:String = 'JassGroupEvent';
		// event types
		public static const SHOW_NEW_GROUP_MASK:String = NAME + 'ShowNewGroupMask';
		public static const CHANGE_CURRENT_GROUP:String = NAME + 'ChangeCurrentGroup';
		public static const NEW_JASS_WITH_GROUP:String = NAME + 'NewJassWithGroup';
		
		public var group:IJassGroup;
		
		/**
		 * COnstructor 
		 * @param type
		 * @param group
		 * @param bubbles
		 * @param cancelable
		 */
		public function JassGroupEvent(type:String, group:IJassGroup=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.group = group;
		}
	}
}