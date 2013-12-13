/**
 * Actor.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.extensions.localEventMap.api.IEventMap;
	import robotlegs.bender.extensions.localEventMap.impl.EventMap;

	/**
	 * Base class for actors 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class Actor
	{
		
		/**
		 * @private
		 */
		protected var _eventDispatcher:IEventDispatcher;
		/**
		 * @private
		 */
		protected var _eventMap:IEventMap;
		
		//---------------------------------------------------------------------
		//  API
		//---------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function get eventDispatcher():IEventDispatcher
		{
			return _eventDispatcher;
		}
		
		[Inject]
		/**
		 * @private
		 */
		public function set eventDispatcher(value:IEventDispatcher):void
		{
			_eventDispatcher = value;
		}
		
		//---------------------------------------------------------------------
		//  Internal
		//---------------------------------------------------------------------
		
		/**
		 * Local EventMap
		 *
		 * @return The EventMap for this Actor
		 */
		protected function get eventMap():IEventMap
		{
			return _eventMap || (_eventMap = new EventMap());
		}
		
		/**
		 * Dispatch helper method
		 *
		 * @param event The <code>Event</code> to dispatch on the <code>IContext</code>'s <code>IEventDispatcher</code>
		 */
		protected function dispatch(event:Event):Boolean
		{
			if(eventDispatcher.hasEventListener(event.type))
				return eventDispatcher.dispatchEvent(event);
			return false;
		}
	}
}