package test.info.tiefenauer
{
	import com.adobe.protocols.oauth2.OAuth2;
	
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	import info.tiefenauer.jasskass.app.controller.startup.GetOAuth2AccessToken;
	import info.tiefenauer.jasskass.app.event.GoogleAuthEvent;
	import info.tiefenauer.jasskass.app.model.ConfigProxy;
	import info.tiefenauer.jasskass.app.model.enum.ConfigKey;
	import info.tiefenauer.jasskass.app.model.vo.AppConfiguration;
	
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.as3commons.logging.setup.LogSetupLevel;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	import robotlegs.bender.framework.impl.Context;

	public class SampleTest
	{
		[Rule] public var rule:MockolateRule = new MockolateRule();
		
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
		[Test(description="Sample Test")]
		public function shouldAssert():void{
			assertTrue(true);
		}
	}
}