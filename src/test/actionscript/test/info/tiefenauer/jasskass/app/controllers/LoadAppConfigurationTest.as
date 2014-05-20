/**
 * LoadAppConfigurationTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.app.controllers
{
	import info.tiefenauer.jasskass.app.controller.startup.LoadAppConfiguration;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.TextFileService;

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
		[Ignore]
		[Test]
		public function testCommand():void{
			command.execute();
		}
	}
}