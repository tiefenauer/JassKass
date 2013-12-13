/**
 * AppConfigurationTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.app.models.vo
{
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class AppConfigurationTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var config:AppConfiguration;
		private var configXML:XML = <config key="someKey">someValue</config>;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			config = new AppConfiguration();
		}
		
		[After]
		public function tearDown():void
		{
			config = null;
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
			assertNull(config.key);
			assertNull(config.value);
			config = new AppConfiguration('someKey', 'someValue');
			assertEquals('someKey', config.key);
			assertEquals('someValue', config.value);
		}
		[Test]
		public function testFromXML():void{
			config.fromXML(configXML);
			assertEquals(configXML.@key, config.key);
			assertEquals(configXML.text(), config.value);
		}
		[Test]
		public function testToXML():void{
			config.key = 'someKey';
			config.value = 'someValue';
			var xml:XML = config.toXML();
			assertEquals(configXML.@key, xml.@key);
			assertEquals(configXML.text(), xml.text());
		}
	}
}