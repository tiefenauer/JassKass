package info.tiefenauer.jasskass.profile.controller.azure
{
	import flash.net.URLLoader;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.azure.service.GroupService;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	import info.tiefenauer.jasskass.profile.views.phone.GroupCreatedView;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class AddAzureJassGroup extends SimpleCommand
	{
		[Inject] public var event:AzureGroupEvent;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		[Inject] public var app:JassKass;
		[Inject] public var service:GroupService;
		
		private var loader:URLLoader = new URLLoader();
		
		/**
		 * 
		 * 
		 */
		override public function execute():void{
			super.execute();
			
			detain();
			service.onSuccess.addOnce(onGroupAdded);
			service.addGroup(event.group);
		}
		
		
		/**
		 * 
		 * @param group
		 * 
		 */
		private function onGroupAdded(group:JassGroup):void{
			release()
			group.isSynced = true;
			jassGroupProxy.currentJassGroup = group;
			dispatch(new JassGroupProxyEvent(JassGroupProxyEvent.SAVE_JASS_GROUPS_TO_FILE));
			app.activeNavigator.pushView(GroupCreatedView, group);
		}
	}
}