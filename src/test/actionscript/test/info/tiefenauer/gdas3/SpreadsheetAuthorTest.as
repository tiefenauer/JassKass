/**
 * SpreadsheetAuthorTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import flash.utils.ByteArray;
	
	import info.tiefenauer.gdas3.model.SpreadsheetAuthor;
	import info.tiefenauer.gdas3.model.SpreadsheetLink;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SpreadsheetAuthorTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var author:SpreadsheetAuthor;
		private var authorXML:XML;
		
		[Embed(source='assets/spreadsheetAuthor.xml', mimeType='application/octet-stream')]
		private static const AuthorXMLFile:Class;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			var authorXMLContent:ByteArray = new AuthorXMLFile() as ByteArray;
			authorXML = XML(authorXMLContent.readUTFBytes(authorXMLContent.length));
			
			author = new SpreadsheetAuthor();
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
			assertNull(author.name)
			assertNull(author.email);
		}
		[Test]
		public function testAttributes():void{
			author = new SpreadsheetAuthor('name', 'john.doe@domain.com');
			assertEquals('name', author.name);
			assertEquals('john.doe@domain.com', author.email);
		}
		[Test]
		public function testFromXML():void{
			author.fromXML(authorXML);
			assertEquals(authorXML.name, author.name);
			assertEquals(authorXML.email, author.email);
		}
		[Test]
		public function testToXML():void{
			testFromXML();
			var xml:XML = author.toXML();
			assertEquals(author.name, xml.name);
			assertEquals(author.email, xml.email);
		}
	}
}