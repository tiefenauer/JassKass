/**
 * SettingProxyTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package flexUnitTests.models
{
	import info.tiefenauer.jasskass.app.model.SettingProxy;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfiguration;
	import info.tiefenauer.jasskass.app.model.interfaces.ISetting;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	import info.tiefenauer.jasskass.app.model.vo.Setting;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class SettingProxyTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var proxy:SettingProxy;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			proxy = new SettingProxy();
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
			proxy.addSetting(new Setting('key_0', 'value_0'));
			proxy.addSetting(new Setting('key_1', 'value_1'));
			proxy.addSetting(new Setting('key_2', 'value_2'));
			var setting0:ISetting = proxy.getSettingByKey('key_0');
			var setting1:ISetting = proxy.getSettingByKey('key_1');
			var setting2:ISetting = proxy.getSettingByKey('key_2');
			assertNotNull(setting0);
			assertEquals('value_0', setting0.value);
			assertNotNull(setting1);
			assertEquals('value_1', setting1.value);
			assertNotNull(setting2);
			assertEquals('value_2', setting2.value);
		}
		[Test(description="adding another item with same key should overwrite the old one")]
		public function testAddDouble():void{
			proxy.addSetting(new Setting('key_0', 'value_0'));
			proxy.addSetting(new Setting('key_1', 'value_1'));
			proxy.addSetting(new Setting('key_2', 'value_2'));
			proxy.addSetting(new Setting('key_0', 'someNewValue'));
			var setting:ISetting = proxy.getSettingByKey('key_0');
			assertNotNull(setting);
			assertEquals('someNewValue', setting.value);
		}
		[Test]
		public function testGetByKey():void{
			proxy.addSetting(new Setting('key_0', 'value_0'));
			proxy.addSetting(new Setting('key_1', 'value_1'));
			proxy.addSetting(new Setting('key_2', 'value_2'));
			var config:ISetting = proxy.getSettingByKey('key_1');
			assertNotNull(config);
			assertEquals('key_1', config.key);
			assertEquals('value_1', config.value);
		}
	}
}