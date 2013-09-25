/**
 * SpreadsheetContent.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.model
{
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetContent;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class SpreadsheetContent implements ISpreadsheetContent
	{
		private var _type:String;
		private var _src:String;
		
		/**
		 * Constructor 
		 * @param type
		 * @param src
		 * 
		 */
		public function SpreadsheetContent(type:String=null, src:String=null){
			_type = type;
			_src = src;
		}
		
		
		//-------------------------------
		// Public functions
		//-------------------------------
		/**
		 * SpreadsheetContent ==> XML 
		 * @return 
		 */
		public function toXML():XML{
			var xml:XML = <content/>;
			if (_type)
				xml.@type = _type;
			if (_src)
				xml.@src = _src;
			return xml;
		}
		
		/**
		 * XML ==> SpreadsheetContent 
		 * @param xml
		 */
		public function fromXML(xml:XML):void{
			if (xml.@type && xml.@type != '')
				_type = xml.@type;
			if (xml.@src && xml.@src != '')
				_src = xml.@src;
		}
		
		//-------------------------------
		// Getter/Setter
		//-------------------------------
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void{
			_type = value;
		}
		public function get src():String{
			return _src;
		}
		public function set src(value:String):void{
			_src = value;
		}
		

	}
}