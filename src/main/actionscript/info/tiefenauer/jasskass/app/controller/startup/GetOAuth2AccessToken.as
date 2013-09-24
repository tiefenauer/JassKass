/**
 * GetOAuth2AccessToken.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import com.adobe.protocols.oauth2.OAuth2;
	import com.adobe.protocols.oauth2.event.GetAccessTokenEvent;
	import com.adobe.protocols.oauth2.grant.IGrantType;
	import com.adobe.protocols.oauth2.grant.ImplicitGrant;
	
	import flash.media.StageWebView;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	import info.tiefenauer.jasskass.app.event.GoogleAuthEvent;
	import info.tiefenauer.jasskass.app.model.enum.ConfigKey;
	import info.tiefenauer.jasskass.app.model.interfaces.IConfigProxy;
	
	/**
	 * Get oAuth2-Access Token for access to Google Api 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class GetOAuth2AccessToken extends SimpleCommand
	{
		[Inject] public var event:InitializationEvent;
		[Inject] public var oAuth2:OAuth2;
		[Inject] public var configProxy:IConfigProxy;
		
		private var stageWebView:StageWebView = new StageWebView();
		
		override public function execute():void{
			super.execute();
			var bla:String = configProxy.getConfigurationByKey(ConfigKey.GOOGLE_API_CONFIG).value;
			var googleObj:Object = JSON.parse(configProxy.getConfigurationByKey(ConfigKey.GOOGLE_API_CONFIG).value);
			var clientID:String = googleObj['web']['client_id']?googleObj['web']['client_id']:'';
			var redirectURI:String = googleObj['web']['redirect_uris']?(googleObj['web']['redirect_uris'] as Array)[0]:'';
			
			var grant:IGrantType = new ImplicitGrant(stageWebView, clientID, redirectURI, "https://www.googleapis.com/auth/userinfo.profile");
			oAuth2.addEventListener(GetAccessTokenEvent.TYPE, onGetAccessToken);
			detain();
			oAuth2.getAccessToken(grant);

		}
		
		private  function onGetAccessToken(getAccessTokenEvent:GetAccessTokenEvent):void{
			release();
			stageWebView.dispose();
			dispatch(new GoogleAuthEvent(GoogleAuthEvent.ACCESS_TOKEN_RECEIVED, getAccessTokenEvent.accessToken));
		}
	}
}