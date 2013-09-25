/**
 * SpreadsheetLinkTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import flash.utils.ByteArray;
	
	import info.tiefenauer.gdas3.model.SpreadsheetLink;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SpreadsheetLinkTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var link:SpreadsheetLink;
		private var linkXML:XML;
		
		[Embed(source='assets/spreadsheetLink.xml', mimeType='application/octet-stream')]
		private static const LinkXMLFile:Class;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			var linkXMLContent:ByteArray = new LinkXMLFile() as ByteArray;
			linkXML = XML(linkXMLContent.readUTFBytes(linkXMLContent.length));
			link = new SpreadsheetLink();
		}
		
		[After]
		public function tearDown():void
		{
			link = null;
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
			assertNull(link.rel);
			assertNull(link.type);
			assertNull(link.href);
		}
		[Test]
		public function testAttributes():void{
			link = new SpreadsheetLink('rel', 'type', 'href');
			assertEquals('rel', link.rel);
			assertEquals('type', link.type);
			assertEquals('href', link.href);
		}
		[Test]
		public function testFromXML():void{
			link.fromXML(linkXML);
			assertEquals(linkXML.@rel, link.rel);
			assertEquals(linkXML.@type, link.type);
			assertEquals(linkXML.@href, link.href);
		}
		[Test]
		public function testToXML():void{
			testFromXML();
			var xml:XML = link.toXML();
			assertEquals(link.rel, xml.@rel);
			assertEquals(link.type, xml.@type);
			assertEquals(link.href, xml.@href);
		}
	}
}