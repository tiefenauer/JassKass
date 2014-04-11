/**
 * SpreadsheetCategoryTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import flash.utils.ByteArray;
	
	import info.tiefenauer.gdas3.model.SpreadsheetCategory;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SpreadsheetCategoryTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var category:SpreadsheetCategory;
		private var categoryXML:XML;
		
		[Embed(source='/spreadsheetCategory.xml', mimeType='application/octet-stream')]
		private static const CategoryXMLFile:Class;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			var categoryXMLContent:ByteArray = new CategoryXMLFile() as ByteArray;
			categoryXML = XML(categoryXMLContent.readUTFBytes(categoryXMLContent.length));
			
			category = new SpreadsheetCategory();
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
			assertNull(category.scheme);
			assertNull(category.term);
		}
		[Test]
		public function testAttributes():void{
			category = new SpreadsheetCategory('scheme', 'term');
			assertEquals('scheme', category.scheme);
			assertEquals('term', category.term);
		}
		[Test]
		public function testFromXML():void{
			category.fromXML(categoryXML);
			assertEquals(categoryXML.@scheme, category.scheme);
			assertEquals(categoryXML.@term, category.term);
		}
		[Test]
		public function testToXML():void{
			testFromXML();
			var xml:XML = category.toXML();
			assertEquals(category.scheme, xml.@scheme);
			assertEquals(category.term, xml.@term);
		}
	}
}