package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.views.base.ProfileViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IProfileView;
	import info.tiefenauer.jasskass.profile.views.phone.GroupBuilderView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class ProfileViewMediator extends Mediator
	{
		[Inject] public var view:IProfileView;
		[Inject] public var app:JassKass;
		
		override public function initialize():void{
			addViewListener(ProfileViewBase.NEW_TEAM_BUTTON_CLICKED, onNewTeamButtonClicked);
		}
		
		//--------------------------------
		// View Event handlers
		//--------------------------------
		private function onNewTeamButtonClicked(event:Event):void{
			app.activeNavigator.pushView(GroupBuilderView, new JassGroup());
		}
	}
}