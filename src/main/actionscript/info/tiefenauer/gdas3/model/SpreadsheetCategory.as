/**
 * SpreadsheetCategory.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.model
{
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetCategory;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	public class SpreadsheetCategory implements ISpreadsheetCategory
	{
		private var _scheme:String;
		private var _term:String;
		
		public function SpreadsheetCategory(scheme:String=null, term:String=null){
			_scheme = scheme;
			_term = term;
		}
		
		//-------------------------------
		// Public functions
		//-------------------------------
		/**
		 * SpreadsheetCategory ==> XML 
		 * @return 
		 * 
		 */
		public function toXML():XML{
			var xml:XML = <category/>;
			if (_scheme)
				xml.@scheme = _scheme;
			if (_term)
				xml.@term = _term;
			return xml;
		}
		
		/**
		 * XML ==> SpreadsheetCategory 
		 * @param xml
		 * 
		 */
		public function fromXML(xml:XML):void{
			if (xml.@scheme && xml.@scheme != '')
				_scheme = xml.@scheme;
			if (xml.@term && xml.@term != '')
				_term = xml.@term;
		}
		
		//-------------------------------
		// Getter/Setter
		//-------------------------------
		public function get scheme():String{
			return _scheme;
		}
		public function set scheme(value:String):void{
			_scheme = value;
		}
		public function get term():String{
			return _term;
		}
		public function set term(value:String):void{
			_term = value;
		}
		
	}
}