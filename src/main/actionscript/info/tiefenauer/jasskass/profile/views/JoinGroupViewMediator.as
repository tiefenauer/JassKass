package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.profile.events.JoinGroupEvent;
	import info.tiefenauer.jasskass.profile.views.base.JoinGroupViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJoinGroupView;
	
	public class JoinGroupViewMediator extends SimpleMediator
	{
		[Inject] public var view:IJoinGroupView;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(JoinGroupViewBase.SUBMIT_BUTTON_CLICKED, onSubmitButtonClicked);
			addViewListener(JoinGroupViewBase.CANCEL_BUTTON_CLICKED, onCancelButtonClicked);
			
			addContextListener(JoinGroupEvent.GROUP_JOINED, onGroupRegistered);
		}
		
		//------------------------
		// View Event handlers
		//------------------------
		private function onSubmitButtonClicked(event:Event):void{
			dispatch(new JoinGroupEvent(JoinGroupEvent.JOIN_GROUP, view.code));
		}
		private function onCancelButtonClicked(event:Event):void{
			app.activeNavigator.popView();
		}
		
		//------------------------
		// View Event handlers
		//------------------------
		private function onGroupRegistered(event:Event):void{
			app.activeNavigator.popView();
		}
	}
}