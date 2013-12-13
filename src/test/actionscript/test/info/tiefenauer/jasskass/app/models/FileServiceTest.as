/**
 * FileServiceTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.app.models
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.model.FileService;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class FileServiceTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var fileService:FileService;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			fileService = new FileService();
		}
		
		[After]
		public function tearDown():void
		{
			fileService = null;
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
			assertNull(fileService.file);
			assertNotNull(fileService.onDataLodaded);
			assertNotNull(fileService.onDataSaved);
			assertNotNull(fileService.onLoadError);
			assertNotNull(fileService.onSaveError);
		}
		[Test]
		public function testGetterSetter():void{
			fileService.file = File.applicationDirectory.resolvePath('path/to/some/file.txt');
			assertNotNull(fileService.file);
			assertEquals('app:/path/to/some/file.txt', fileService.file.url);
		}
	}
}