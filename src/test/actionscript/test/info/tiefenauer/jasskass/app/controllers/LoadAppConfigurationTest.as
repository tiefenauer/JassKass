/**
 * LoadAppConfigurationTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.app.controllers
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.startup.LoadAppConfiguration;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.TextFileService;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfiguration;
	import info.tiefenauer.jasskass.app.model.vo.ConfigFile;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class LoadAppConfigurationTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var command:LoadAppConfiguration;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			command = new LoadAppConfiguration();
			command.configFile = new ConfigFile(File.applicationDirectory.resolvePath('assets/sampleConfig.xml').nativePath);
			command.fileService = new TextFileService();
			command.configProxy = new ConfigProxy();
		}
		
		[After]
		public function tearDown():void
		{
			command = null;
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
		public function testCommand():void{
			command.execute();
			var config0:IConfiguration = command.configProxy.getConfigurationByKey('key_0');
			var config1:IConfiguration = command.configProxy.getConfigurationByKey('key_1');
			var config2:IConfiguration = command.configProxy.getConfigurationByKey('key_2');
			var config3:IConfiguration = command.configProxy.getConfigurationByKey('key_3');
			assertNotNull(config0);
			assertEquals('value_0', config0.value);
			assertNotNull(config1);
			assertEquals('value_1', config1.value);
			assertNotNull(config2);
			assertEquals('value_2', config2.value);
			assertNotNull(config3);
			assertEquals('value_3', config3.value);
		}
	}
}