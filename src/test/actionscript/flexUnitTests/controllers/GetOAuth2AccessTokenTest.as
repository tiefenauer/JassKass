/**
 * GetOAuth2AccessTokenTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package flexUnitTests.controllers
{
	import com.adobe.protocols.oauth2.OAuth2;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	import info.tiefenauer.jasskass.app.JassKassConfig;
	import info.tiefenauer.jasskass.app.controller.startup.GetOAuth2AccessToken;
	import info.tiefenauer.jasskass.app.event.GoogleAuthEvent;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.enum.ConfigKey;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.as3commons.logging.setup.LogSetupLevel;
	import org.flexunit.async.Async;
	
	import robotlegs.bender.framework.impl.Context;

	public class GetOAuth2AccessTokenTest
	{	
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var configProxy:ConfigProxy;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		[Embed(source="assets/GoogleAPIClient.json", mimeType="application/octet-stream")]
		private static const GoogleApiClientConfig:Class;
		private var command:GetOAuth2AccessToken;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			// create mocks
			var bytes:ByteArray = new GoogleApiClientConfig() as ByteArray;
			var apiJSON:String = bytes.readUTFBytes(bytes.length);
			stub(configProxy).method('getConfigurationByKey').returns(new AppConfiguration(ConfigKey.GOOGLE_API_CONFIG, apiJSON));
			
			// set up command
			command = new GetOAuth2AccessToken();
			command.context = new Context();
			command.configProxy = configProxy;
			command.oAuth2 = new OAuth2("https://accounts.google.com/o/oauth2/auth", "https://accounts.google.com/o/oauth2/token", LogSetupLevel.ALL);
			command.eventDispatcher = new EventDispatcher();
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
		[Test(async,timeout="1000")]
		public function testCommand():void{
			Async.proceedOnEvent(this, command.eventDispatcher, GoogleAuthEvent.ACCESS_TOKEN_RECEIVED);
			command.execute();
		}
	}
}