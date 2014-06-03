package info.tiefenauer.jasskass.settings.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.settings.model.interfaces.ISettingsProxy;
	import info.tiefenauer.jasskass.settings.signals.SaveSettingsSignal;
	import info.tiefenauer.jasskass.settings.views.base.SettingsViewBase;
	import info.tiefenauer.jasskass.settings.views.interfaces.ISettingsView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * 
	 * @author dtie
	 */
	public class SettingsViewMediator extends Mediator
	{
		[Inject] public var view:ISettingsView;
		[Inject] public var settingsProxy:ISettingsProxy;
		[Inject] public var saveSettingsSignal:SaveSettingsSignal;
		
		/**
		 *  
		 */
		override public function initialize():void{
			super.initialize();
			addViewListener(SettingsViewBase.SAVE_SETTINGS_CLICKED, onSaveButtonClicked);
			
			view.settings = settingsProxy.settings;
		}
		
		/**
		 * 
		 * @param event
		 */
		private function onSaveButtonClicked(event:Event):void{
			saveSettingsSignal.dispatch(view.settings);
		}
		
	}
}