/**
 * SpreadsheetTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import flash.utils.ByteArray;
	
	import info.tiefenauer.gdas3.model.Spreadsheet;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SpreadsheetTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var spreadsheet:Spreadsheet;
		private var spreadsheetXML:XML;
		
		[Embed(source='/assets/spreadsheet.xml', mimeType='application/octet-stream')]
		private static const XMLSpreadsheetFile:Class;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			var spreadsheetXMLContent:ByteArray = new XMLSpreadsheetFile() as ByteArray;
			spreadsheetXML = XML(spreadsheetXMLContent.readUTFBytes(spreadsheetXMLContent.length));
			
			spreadsheet = new Spreadsheet();
		}
		
		[After]
		public function tearDown():void
		{
			spreadsheet = null;
			spreadsheetXML = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/  
		[Test]
		public function testDefaults():void{
			assertNull(spreadsheet.etag);
			assertNull(spreadsheet.id);
			assertNull(spreadsheet.title);
			assertNull(spreadsheet.updated);
			assertNull(spreadsheet.category);
			assertNull(spreadsheet.content);
			assertEquals(0, spreadsheet.links.length);
			assertNull(spreadsheet.author);
		}
		[Test]
		public function testFromXML():void{
			spreadsheet.fromXML(spreadsheetXML);
			assertEquals(spreadsheetXML.@gd, spreadsheet.etag);
			assertEquals(spreadsheetXML.id, spreadsheet.id);
			assertEquals(spreadsheetXML.category.@scheme, spreadsheet.category.scheme);
			assertEquals(spreadsheetXML.category.@term, spreadsheet.category.term);
			assertEquals(spreadsheetXML.title, spreadsheet.title);
			assertEquals(spreadsheetXML.content.@type, spreadsheet.content.type);
			assertEquals(XMLList(spreadsheetXML.link).length(), spreadsheet.links.length);
			assertEquals(spreadsheetXML.author.name, spreadsheet.author.name);
			assertEquals(spreadsheetXML.author.email, spreadsheet.author.email);
		}
		[Test]
		public function testToXML():void{
			testFromXML();
			var xml:XML = spreadsheet.toXML();
			assertEquals(spreadsheet.etag, xml.@gd);
			assertEquals(spreadsheet.id, xml.id);
			assertEquals(spreadsheet.category.scheme, xml.category.@scheme);
			assertEquals(spreadsheet.category.term, xml.category.@term);
			assertEquals(spreadsheet.title, xml.title);
			assertEquals(spreadsheet.content.type, xml.content.@type);
			assertEquals(spreadsheet.links.length, XMLList(xml.link).length());
			assertEquals(spreadsheet.author.name, xml.author.name);
			assertEquals(spreadsheet.author.email, xml.author.email);
		}
	}
}