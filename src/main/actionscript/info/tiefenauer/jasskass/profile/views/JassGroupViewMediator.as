package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	import info.tiefenauer.jasskass.profile.views.base.JassGroupViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupView;
	import info.tiefenauer.jasskass.profile.views.phone.GroupBuilderView;
	import info.tiefenauer.jasskass.profile.views.phone.JassGroupListView;
	import info.tiefenauer.jasskass.profile.views.phone.JoinGroupView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class JassGroupViewMediator extends Mediator
	{
		[Inject] public var view:IJassGroupView;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		[Inject] public var app:JassKass;
		
		override public function initialize():void{
			addViewListener(JassGroupViewBase.NEW_GROUP_BUTTON_CLICKED, onNewTeamButtonClicked);
			addViewListener(JassGroupViewBase.CHANGE_GROUP_BUTTON_CLICKED, onChangeTeamButtonClicked);
			addViewListener(JassGroupViewBase.JOIN_GROUP_BUTTON_CLICKED, onRegisterTeamButtonClicked);
			addViewListener(JassGroupViewBase.LEAVE_GROUP_BUTTON_CLICKED, onLeaveTeamButtonClicked);
			
			view.jassGroup = jassGroupProxy.currentJassGroup;
		}
		
		//--------------------------------
		// View Event handlers
		//--------------------------------
		private function onNewTeamButtonClicked(event:Event):void{
			app.activeNavigator.pushView(GroupBuilderView, new JassGroup());
		}
		private function onChangeTeamButtonClicked(event:Event):void{
			app.activeNavigator.pushView(JassGroupListView);
		}
		private function onRegisterTeamButtonClicked(event:Event):void{
			app.activeNavigator.pushView(JoinGroupView);
		}
		private function onLeaveTeamButtonClicked(event:Event):void{
		}
	}
}