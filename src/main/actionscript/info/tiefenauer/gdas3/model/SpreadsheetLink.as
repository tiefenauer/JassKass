/**
 * SpreadsheetLink.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.model
{
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetLink;
	
	/**
	 * Spreadsheet link
	 * @author Daniel Tiefenauer
	 */
	public class SpreadsheetLink implements ISpreadsheetLink
	{
		private var _rel:String;
		private var _type:String;
		private var _href:String;
		
		/**
		 * Constructor 
		 * @param rel
		 * @param type
		 * 
		 */
		public function SpreadsheetLink(rel:String=null, type:String=null, href:String=null){
			_rel = rel;
			_type = type;
			_href = href;
		}
		
		//-------------------------------
		// Public functions
		//-------------------------------

		/**
		 * SpreadsheetLink ==> XML 
		 * @return 
		 */
		public function toXML():XML{
			var xml:XML = <link/>;
			if (_rel)
				xml.@rel = _rel;
			if (_type)
				xml.@type = _type;
			if (_href)
				xml.@href = _href;
			return xml;
		}
		
		/**
		 * XML ==> SpreadsheetLink 
		 * @param xml
		 * 
		 */
		public function fromXML(xml:XML):void{
			if (xml.@rel && xml.@rel != '')
				_rel = xml.@rel;
			if (xml.@type && xml.@type != '')
				_type = xml.@type;
			if (xml.@href && xml.@href != '')
				_href = xml.@href;
		}

		//-------------------------------
		// Getter/Setter
		//-------------------------------
		public function get rel():String{
			return _rel;
		}
		public function set rel(value:String):void{
			_rel = value;
		}
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void{
			_type = value;
		}
		public function get href():String{
			return _href;
		}
		public function set href(value:String):void{
			_href = value;
		}
	}
}