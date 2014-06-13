package info.tiefenauer.jasskass.profile.views
{
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.AzurePlayerEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.views.phone.GroupBuilderView;
	
	/**
	 * Mediator für ProfileViews 
	 * @author Daniel
	 */
	public class GroupBuilderViewMediator extends SimpleMediator
	{
		[Inject] public var view:GroupBuilderView;
		
		override public function initialize():void{
			super.initialize();
			view.onSubmitClicked.add(onSubmitClicked);
			
			addContextListener(AzureGroupEvent.GROUP_ADDED, onGroupCreated);
			addContextListener(AzurePlayerEvent.PLAYER_CREATED, onPlayerCreated);
		}
		
		//---------------------------------
		// View Event handlers
		//---------------------------------
		private function onSubmitClicked(group:IJassGroup):void{
			view.setCurrentState('communicating');
			dispatch(new AzureGroupEvent(AzureGroupEvent.ADD_GROUP, group));
		}
		
		//---------------------------------
		// Context Event handlers
		//---------------------------------
		private function onGroupCreated(event:AzureGroupEvent):void{
			view.setCurrentState('default');
			trace('Group created! Group-ID: ' + event.group.id);
		}
		private function onPlayerCreated(event:AzurePlayerEvent):void{
			trace('Player created! Group-ID: ' + event.player.id);
		}
	}
}