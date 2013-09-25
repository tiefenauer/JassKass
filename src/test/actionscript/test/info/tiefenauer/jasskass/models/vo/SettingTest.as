/**
 * SettingTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.models.vo
{
	import info.tiefenauer.jasskass.app.model.vo.Setting;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SettingTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var setting:Setting;
		private var settingXML:XML;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			setting = new Setting('someKey', 'someValue');
			settingXML = <setting key="someKey">someValue</setting>;
		}
		
		[After]
		public function tearDown():void
		{
			setting = null;
			settingXML = null;
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
			assertEquals('someKey', setting.key);
			assertEquals('someValue', setting.value);
			setting = new Setting();
			assertNull(setting.key);
			assertNull(setting.value);
		}
		[Test]
		public function testFromXML():void{
			setting = new Setting();
			setting.fromXML(settingXML);
			assertEquals('someKey', setting.key);
			assertEquals('someValue', setting.value);
		}
		[Test]
		public function testToXML():void{
			var xml:XML = setting.toXML();
			assertEquals('someKey', xml.@key);
			assertEquals('someValue', xml.text());
		}
	}
}