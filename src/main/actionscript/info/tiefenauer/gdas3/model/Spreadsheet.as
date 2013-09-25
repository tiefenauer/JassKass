/**
 * Spreadsheet.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3.model
{
	import info.tiefenauer.gdas3.interfaces.ISpreadsheet;
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetAuthor;
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetCategory;
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetContent;
	import info.tiefenauer.gdas3.interfaces.ISpreadsheetLink;
	
	/**
	 * Base class representing a spreadsheet 
	 * @author Daniel Tiefenauer
	 */
	public class Spreadsheet implements ISpreadsheet
	{
		private var _id:String;
		private var _etag:String;
		private var _title:String;
		private var _updated:Date;
		private var _category:ISpreadsheetCategory;
		private var _content:ISpreadsheetContent;
		private var _links:Vector.<ISpreadsheetLink> = new Vector.<ISpreadsheetLink>();
		private var _author:ISpreadsheetAuthor;

		//--------------------------------------
		// Public functions
		//--------------------------------------
		/**
		 * Spreadsheet ==> XML
		 * @return 
		 */
		public function toXML():XML{
			var xml:XML = <entry />;
			if (_etag)
				xml.@gd = _etag;
			if (_id)
				xml.id = _id;
			if (_title)
				xml.title = _title;
			if (_updated)
				xml.updated = _updated.toDateString();
			if (_category)
				xml.appendChild(_category.toXML());
			if (_content)
				xml.appendChild(_content.toXML());
			for each(var link:ISpreadsheetLink in _links){
				xml.appendChild(link.toXML());
			}
			if (_author)
				xml.appendChild(_author.toXML());
			return xml;
		}
		
		/**
		 * XML ==> Spreadsheet  
		 * @param value
		 * 
		 */
		public function fromXML(xml:XML):void{
			if (xml.@gd && xml.@gd != '')
				_etag = xml.@gd;
			
			for each(var node:XML in xml.children()){
				switch(node.localName()){
					case 'id':
						_id = node.text();
						break;
					case 'updated':
						// TO DO: Parse Date
						break;
					case 'category':
						_category = new SpreadsheetCategory();
						_category.fromXML(node);
						break;
					case 'title':
						_title = node.text();
						break;
					case 'content':
						_content = new SpreadsheetContent();
						_content.fromXML(node);
						break;
					case 'link':
						var link:ISpreadsheetLink = new SpreadsheetLink();
						link.fromXML(node);
						_links.push(link);
						break;
					case 'author':
						_author = new SpreadsheetAuthor();
						_author.fromXML(node);
						break;
				}
			}
		}
		
		//--------------------------------------
		// Getter/Setter
		//--------------------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get etag():String{
			return _etag;
		}
		public function set etag(value:String):void{
			_etag = value;
		}
		public function get title():String{
			return _title;
		}
		public function set title(value:String):void{
			_title = value;
		}
		public function get author():ISpreadsheetAuthor{
			return _author;
		}
		public function set author(value:ISpreadsheetAuthor):void{
			_author = value;
		}
		public function get updated():Date{
			return _updated;
		}
		public function set updated(value:Date):void{
			_updated = value;
		}
		public function get category():ISpreadsheetCategory{
			return _category;
		}
		public function set category(value:ISpreadsheetCategory):void{
			_category = value;
		}
		public function get content():ISpreadsheetContent{
			return _content;
		}
		public function set content(value:ISpreadsheetContent):void{
			_content = value;
		}
		public function get links():Vector.<ISpreadsheetLink>{
			return _links;
		}
	}
}