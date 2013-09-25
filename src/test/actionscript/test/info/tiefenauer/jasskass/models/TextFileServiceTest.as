/**
 * TextFileServiceTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.models
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import info.tiefenauer.jasskass.app.model.TextFileService;
	
	import org.flexunit.asserts.assertEquals;

	public class TextFileServiceTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		[Embed(source="assets/sampleTextFile.txt",mimeType="application/octet-stream")]
		private static const SampleFile:Class;
		
		private var service:TextFileService; 
		private var testFile:File;
		private var testContent:String;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			service = new TextFileService();
			testFile = File.applicationDirectory.resolvePath('assets/sampleTextFile.txt');
			var bytes:ByteArray = new SampleFile() as ByteArray;
			testContent = bytes.readUTFBytes(bytes.length);
		}
		
		[After]
		public function tearDown():void
		{
			service = null;
			testFile = null;
			testContent = null;
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
		public function testRead():void{
			service.file = testFile;
			var result:String = service.read();
			assertEquals(result, testContent);
		}
		[Test]
		public function testWrite():void{
			service.file = File.createTempFile();
			service.write(testContent);
			
			var fs:FileStream = new FileStream();
			fs.open(testFile, FileMode.READ);
			var content:String = fs.readUTFBytes(fs.bytesAvailable);
			fs.close();
			
			assertEquals(content, testContent);
		}
		[Test(description='trying to read from an inexistent file should throw Error', expects="Error")]
		public function testReadInexistentFile():void{
			service.file = File.applicationDirectory.resolvePath('path/to/some/inexistent/file.txt');
			var content:String = service.read();
		}
		[Test(description='trying to write to a directory should throw Error',expects="Error")]
		public function testWriteToDirectory():void{
			service.file = File.documentsDirectory;
			service.write(testContent);
		}
		[Test(description='trying to read from a directory should throw Error',expects="Error")]
		public function testReadFromDirectory():void{
			service.file = File.documentsDirectory;
			var content:String = service.read();
		}
	}
}