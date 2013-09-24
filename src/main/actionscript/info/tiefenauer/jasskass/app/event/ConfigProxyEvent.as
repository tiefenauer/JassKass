/**
 * AppConfigurationEvent.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.model.interfaces.IConfiguration;
	
	/**
	 * Event class for App Configuration 
	 * @author Daniel Tiefenauer
	 */
	public class ConfigProxyEvent extends Event
	{
		public static const NAME:String = 'ConfigProxyEvent';
		
		/**
		 * Constructor 
		 * @param type
		 * @param configs
		 * @param bubbles
		 * @param cancelable
		 */
		public function ConfigProxyEvent(type:String, configs:Vector.<IConfiguration>, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}