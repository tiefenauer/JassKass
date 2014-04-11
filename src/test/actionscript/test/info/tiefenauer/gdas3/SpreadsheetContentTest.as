/**
 * SpreadsheetContentTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import flash.utils.ByteArray;
	
	import info.tiefenauer.gdas3.model.SpreadsheetContent;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SpreadsheetContentTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var content:SpreadsheetContent;
		private var contentXML:XML;
		
		[Embed(source='/spreadsheetContent.xml', mimeType='application/octet-stream')]
		private static const XMLContentFile:Class;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			var contentXMLContent:ByteArray = new XMLContentFile() as ByteArray;
			contentXML = XML(contentXMLContent.readUTFBytes(contentXMLContent.length));
			
			content = new SpreadsheetContent();
		}
		
		[After]
		public function tearDown():void
		{
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
			assertNull(content.src);
			assertNull(content.type);
		}
		[Test]
		public function testAttributes():void{
			content = new SpreadsheetContent('type', 'src');
			assertEquals('type', content.type);
			assertEquals('src', content.src);
		}
		[Test]
		public function testFromXML():void{
			content.fromXML(contentXML);
			assertEquals(contentXML.@type, content.type);
			assertEquals(contentXML.@src, content.src);
		}
		[Test]
		public function testToXML():void{
			testFromXML();
			var xml:XML = content.toXML();
			assertEquals(content.type, xml.@type);
			assertEquals(content.src, xml.@src);
		}
	}
}