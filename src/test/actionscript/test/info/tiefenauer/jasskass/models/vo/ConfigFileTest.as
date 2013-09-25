/**
 * ConfigFileTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.models.vo
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.model.vo.ConfigFile;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;

	public class ConfigFileTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var configFile:ConfigFile;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			configFile = new ConfigFile();
		}
		
		[After]
		public function tearDown():void
		{
			configFile = null;
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
		public function testExistingPath():void{
			configFile = new ConfigFile(File.applicationDirectory.resolvePath('assets/sampleConfig.xml').nativePath);
			assertTrue(configFile.exists);
		}
		[Test(expects="Error")]
		public function testInexistentPath():void{
			configFile = new ConfigFile('path/to/nirvana.xml');
		}
	}
}