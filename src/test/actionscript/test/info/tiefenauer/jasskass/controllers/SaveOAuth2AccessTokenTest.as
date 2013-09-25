/**
 * SaveOAuth2AccessTokenTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.jasskass.controllers
{
	import info.tiefenauer.jasskass.app.controller.startup.SaveOAuth2AccessToken;
	import info.tiefenauer.jasskass.app.event.GoogleAuthEvent;
	import info.tiefenauer.jasskass.app.model.SettingProxy;
	import info.tiefenauer.jasskass.app.model.enum.SettingKey;
	import info.tiefenauer.jasskass.app.model.interfaces.ISetting;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class SaveOAuth2AccessTokenTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var command:SaveOAuth2AccessToken;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			command = new SaveOAuth2AccessToken();
			command.event = new GoogleAuthEvent(GoogleAuthEvent.ACCESS_TOKEN_RECEIVED, 'dummyToken');
			command.settingProxy = new SettingProxy();
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
		[Test]
		public function testCommand():void{
			command.execute();
			var setting:ISetting = command.settingProxy.getSettingByKey(SettingKey.GOOGLE_ACCESS_TOKEN);
			assertNotNull(setting);
			assertEquals('dummyToken', setting.value);
		}
			
	}
}