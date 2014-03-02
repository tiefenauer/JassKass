package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.AzurePlayerEvent;
	import info.tiefenauer.jasskass.profile.views.base.GroupBuilderViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IGroupBuilderView;
	
	/**
	 * Mediator für ProfileViews 
	 * @author Daniel
	 */
	public class GroupBuilderViewMediator extends SimpleMediator
	{
		[Inject] public var view:IGroupBuilderView;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(GroupBuilderViewBase.SUBMIT_BUTTON_CLICKED, onCreateTeamButtonClicked);
			
			addContextListener(AzureGroupEvent.GROUP_ADDED, onGroupCreated);
			addContextListener(AzurePlayerEvent.PLAYER_CREATED, onPlayerCreated);
		}
		
		//---------------------------------
		// View Event handlers
		//---------------------------------
		private function onCreateTeamButtonClicked(event:Event):void{
			dispatch(new AzureGroupEvent(AzureGroupEvent.ADD_GROUP, view.jassGroup));
		}
		
		//---------------------------------
		// Context Event handlers
		//---------------------------------
		private function onGroupCreated(event:AzureGroupEvent):void{
			trace('Group created! Group-ID: ' + event.group.id);
		}
		private function onPlayerCreated(event:AzurePlayerEvent):void{
			trace('Player created! Group-ID: ' + event.player.id);
		}
	}
}