/**
 * SpreadsheetAuthor.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.model
{
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetAuthor;
	
	/**
	 * Spreadsheet author 
	 * @author Daniel Tiefenauer
	 */
	public class SpreadsheetAuthor implements ISpreadsheetAuthor
	{
		private var _name:String;
		private var _email:String;
		
		/**
		 * Constructor 
		 * @param name
		 * @param email
		 * 
		 */
		public function SpreadsheetAuthor(name:String=null, email:String=null){
			_name = name;
			_email = email;
		}
		
		//-------------------------------
		// Public functions
		//-------------------------------
		/**
		 * SpreadsheetAuthor ==> XML 
		 * @return 
		 */
		public function toXML():XML{
			var xml:XML = <author/>;
			if (_name)
				xml.name = _name;
			if (_email)
				xml.email = _email;
			return xml;
		}
		
		/**
		 * XML ==> SpreadsheetAUthor 
		 * @param xml
		 */
		public function fromXML(xml:XML):void{
			for each(var node:XML in xml.children()){
				switch(node.localName()){
					case 'name':
						_name = node.text();
						break;
					case 'email':
						_email = node.text();
						break;
				}
			}
		}

		//-------------------------------
		// Getter/Setter
		//-------------------------------
		public function get name():String{
			return _name;
		}
		public function set name(value:String):void{
			_name = value;
		}
		public function get email():String{
			return _email;
		}
		public function set email(value:String):void{
			_email = value;
		}
		
	}
}