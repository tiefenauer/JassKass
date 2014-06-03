package info.tiefenauer.jasskass.profile.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.rest.RESTClientError;
	import info.tiefenauer.jasskass.azure.service.GroupService;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.events.JoinGroupEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class JoinGroup extends SimpleCommand
	{
		[Inject] public var event:JoinGroupEvent;
		[Inject] public var service:GroupService;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		/**
		 * 
		 * 
		 */
		override public function execute():void{
			super.execute();
			
			detain();
			service.onSuccess.addOnce(onGroupReceived);
			service.onError.addOnce(onError);
			service.joinGroup(event.code);
		}
		
		/**
		 * 
		 * @param group
		 * 
		 */		
		private function onGroupReceived(group:IJassGroup):void{
			release();
			group.isSynced = true;
			jassGroupProxy.currentJassGroup = group;
			dispatch(new JassGroupProxyEvent(JassGroupProxyEvent.SAVE_JASS_GROUPS_TO_FILE));
			dispatch(new JassProxyEvent(JassProxyEvent.LOAD_JASSES_FROM_SERVER));
			dispatch(new JoinGroupEvent(JoinGroupEvent.GROUP_JOINED, event.code));
		}
		
		/**
		 * 
		 * @param error
		 */
		private function onError(error:RESTClientError):void{
			release();
			var errorEvent:JoinGroupEvent;
			switch(error.errorID){
				case RESTClientError.NOT_FOUND_404:
					errorEvent = new JoinGroupEvent(JoinGroupEvent.GROUP_NOT_FOUND, event.code);
					break;
			}
			if (errorEvent)
				dispatch(errorEvent);
		}
			
	}
}