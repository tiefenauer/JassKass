/**
 * SpreadsheetServiceTest.as
 * Copyright 2013 Daniel Tiefenauer
 */
package test.info.tiefenauer.gdas3
{
	import com.adobe.protocols.oauth2.OAuth2;
	import com.adobe.protocols.oauth2.event.GetAccessTokenEvent;
	import com.adobe.protocols.oauth2.grant.AuthorizationCodeGrant;
	import com.adobe.protocols.oauth2.grant.IGrantType;
	import com.adobe.protocols.oauth2.grant.ImplicitGrant;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.StageWebView;
	
	import info.tiefenauer.gdas3.SpreadsheetService;
	import info.tiefenauer.gdas3.interfaces.ISpreadsheet;
	
	import org.as3commons.logging.setup.LogSetupLevel;
	import org.flexunit.async.Async;

	public class SpreadsheetServiceTest
	{			
		private static const CLIENT_ID:String = '583687796852-hdb9bf2gpp3c3t3jq30krr9jfnn9upkb.apps.googleusercontent.com';
		private static const CLIENT_SECRET:String = 'dMwAEeWaIu3sINNgI3Hm0-y3';
		private static const REDIRECT_URI:String = 'http://www.adobe.com';
		private static const SCOPE:String = "https://spreadsheets.google.com/feeds https://docs.google.com/feeds";
		//private static const SCOPE:String = "https://www.googleapis.com/auth/userinfo.profile";
		//private static const SCOPE:String = "https://www.googleapis.com/auth/userinfo.profile";
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var service:SpreadsheetService;
		
		private var token:String;
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before(async,order=0,timeout=2000)]
		public function prepare():void{
			var oAuth2:OAuth2 = new OAuth2("https://accounts.google.com/o/oauth2/auth", "https://accounts.google.com/o/oauth2/token", LogSetupLevel.DEBUG);
			var grant:IGrantType = new ImplicitGrant(new StageWebView(), CLIENT_ID, REDIRECT_URI, SCOPE);
			oAuth2.addEventListener(GetAccessTokenEvent.TYPE, function(event:GetAccessTokenEvent):void{
				token = event.accessToken;
			});
			Async.proceedOnEvent(this, oAuth2, GetAccessTokenEvent.TYPE, 2000);
			oAuth2.getAccessToken(grant);
		}
		
		[Before(order=1,timeout=20000)]
		public function setUp():void
		{
			service = new SpreadsheetService(token);
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
		public function testGetSpreadsheetList():void{
			var spreadsheets:Vector.<ISpreadsheet> = service.getSpreadsheetList();
		}
	}
}