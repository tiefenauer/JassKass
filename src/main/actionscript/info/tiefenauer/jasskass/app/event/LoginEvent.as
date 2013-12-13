/**
 * AuthorizationEvent.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.event
{
	import flash.events.Event;
	
	/**
	 * Event class for Authorization 
	 * @author Daniel Tiefenauer
	 */
	public class LoginEvent extends Event
	{
		public static const NAME:String = 'AuthorizationEvent';
		// event types
		public static const ACCESS_TOKEN_RECEIVED:String = NAME + 'AccessTokenReceived';
		
		public var accessToken:String;
		
		public function LoginEvent(type:String, accessToken:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.accessToken = accessToken;
		}
	}
}