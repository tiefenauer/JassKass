/**
 * SettingsFactoryTest.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.settings.model.factory
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.settings.model.factory
{
	import info.tiefenauer.jasskass.settings.model.Setting;
	import info.tiefenauer.jasskass.settings.model.factory.SettingsFactory;
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;
	
	import mockolate.mock;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.asserts.assertEquals;

	public class SettingsFactoryTest
	{		
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var setting:Setting;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/    
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
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
		[Test(description="toObject() should create a correct object")]
		public function testToObject():void{
			mock(setting).getter('key').returns('someKey');
			mock(setting).getter('value').returns('someValue');
			
			var obj:Object = SettingsFactory.toObject(setting);
			assertEquals('someKey', obj.key);
			assertEquals('someValue', obj.value);
		}
		[Test(description="fromObject() should create a correct setting")]
		public function testFromObject():void{
			var setting:ISetting = SettingsFactory.fromObject({
				key: 'someKey',
				value: 'someValue'
			});
			assertEquals('someKey', setting.key);
			assertEquals('someValue', setting.value);
		}
		
	}
}