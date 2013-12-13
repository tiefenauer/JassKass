/**
 * ConfigProxyTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.app.models
{
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfiguration;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class ConfigProxyTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var proxy:ConfigProxy;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			proxy = new ConfigProxy();
		}
		
		[After]
		public function tearDown():void
		{
			proxy = null;
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
		public function testAdd():void{
			proxy.addConfiguration(new AppConfiguration('key_0', 'value_0'));
			proxy.addConfiguration(new AppConfiguration('key_1', 'value_1'));
			proxy.addConfiguration(new AppConfiguration('key_2', 'value_2'));
			var config0:IConfiguration = proxy.getConfigurationByKey('key_0');
			var config1:IConfiguration = proxy.getConfigurationByKey('key_1');
			var config2:IConfiguration = proxy.getConfigurationByKey('key_2');
			assertNotNull(config0);
			assertEquals('value_0', config0.value);
			assertNotNull(config1);
			assertEquals('value_1', config1.value);
			assertNotNull(config2);
			assertEquals('value_2', config2.value);
		}
		[Test(description="adding another item with same key should overwrite the old one")]
		public function testAddDouble():void{
			proxy.addConfiguration(new AppConfiguration('key_0', 'value_0'));
			proxy.addConfiguration(new AppConfiguration('key_1', 'value_1'));
			proxy.addConfiguration(new AppConfiguration('key_2', 'value_2'));
			proxy.addConfiguration(new AppConfiguration('key_0', 'someNewValue'));
			var config:IConfiguration = proxy.getConfigurationByKey('key_0');
			assertNotNull(config);
			assertEquals('someNewValue', config.value);
		}
		[Test]
		public function testGetByKey():void{
			proxy.addConfiguration(new AppConfiguration('key_0', 'value_0'));
			proxy.addConfiguration(new AppConfiguration('key_1', 'value_1'));
			proxy.addConfiguration(new AppConfiguration('key_2', 'value_2'));
			var config:IConfiguration = proxy.getConfigurationByKey('key_1');
			assertNotNull(config);
			assertEquals('key_1', config.key);
			assertEquals('value_1', config.value);
		}
		
	}
}