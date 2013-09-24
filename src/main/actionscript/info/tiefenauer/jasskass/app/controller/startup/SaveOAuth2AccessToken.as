/**
 * SaveOAuth2AccessToken.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.GoogleAuthEvent;
	import info.tiefenauer.jasskass.app.model.enum.SettingKey;
	import info.tiefenauer.jasskass.app.model.interfaces.ISettingProxy;
	import info.tiefenauer.jasskass.app.model.vo.Setting;
	
	/**
	 * Save Access Token
	 * @author Daniel Tiefenauer
	 */
	public class SaveOAuth2AccessToken extends SimpleCommand
	{
		[Inject] public var event:GoogleAuthEvent;
		[Inject] public var settingProxy:ISettingProxy;
		
		override public function execute():void{
			super.execute();
			settingProxy.addSetting(new Setting(SettingKey.GOOGLE_ACCESS_TOKEN, event.accessToken));
		}
	}
}