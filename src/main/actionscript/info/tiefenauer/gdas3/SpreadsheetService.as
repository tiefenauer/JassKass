/**
 * SpreadSheetConnector.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.gdas3
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import info.tiefenauer.gdas3.interfaces.ISpreadsheet;
	
	import org.osflash.signals.Signal;

	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	public class SpreadsheetService 
	{
		private static const SPREADSHEET_FEED_URL:String = "https://spreadsheets.google.com/feeds/spreadsheets/private/full";
		
		public var spreadsheetListLoaded:Signal = new Signal(Vector.<ISpreadsheet>); 
		
		private var _accessToken:String;
		private var _urlLoader:URLLoader;
		
		/**
		 * 
		 * @param accessToken
		 */
		public function SpreadsheetService(accessToken:String){
			_accessToken = accessToken;
		}
		
		public function getSpreadsheetList():Vector.<ISpreadsheet>{
			var vector:Vector.<ISpreadsheet> = new Vector.<ISpreadsheet>();
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onSpreadsheetListLoaded);
			_urlLoader.load(new URLRequest('https://spreadsheets.google.com/feeds/spreadsheets/private/full'));
			return vector;
		}
		
		//-------------------------------
		// Event handlers
		//-------------------------------
		private function onSpreadsheetListLoaded(event:Event):void{
			try {
				var xml:XML = XML(_urlLoader.data);
			}
			catch(error:Error){
				trace(error);
			}
		}
	}
}