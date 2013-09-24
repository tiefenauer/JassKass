/**
 * Setting.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.vo
{
	import info.tiefenauer.jasskass.app.model.interfaces.ISetting;
	
	/**
	 * Base class for all Settings 
	 * @author Daniel Tiefenauer
	 */
	public class Setting implements ISetting
	{
		protected var _key:String;
		protected var _value:String;
		
		/**
		 * Constructor 
		 * @param key
		 * @param value
		 * 
		 */
		public function Setting(key:String=null, value:String=null){
			_key = key;
			_value = value;
		}
		
		//----------------------------
		// Public functions
		//----------------------------
		public function toXML():XML{
			var xml:XML = <setting>{_value}</setting>;
			if (_key)
				xml.@key = _key;
			return xml;
		}
		public function fromXML(xml:XML):void{
			if (xml.@key && xml.@key != '')
				_key = xml.@key;
			_value = xml.text();
		}
		
		//----------------------------
		// Getter/Setter
		//----------------------------
		public function get key():String{
			return _key;
		}
		public function set key(value:String):void{
			_key = value;
		}
		public function get value():String{
			return _value;
		}
		public function set value(value:String):void{
			_value = value;
		}
	}
}