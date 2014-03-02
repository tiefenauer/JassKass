package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.profile.events.RegisterGroupEvent;
	import info.tiefenauer.jasskass.profile.views.base.RegisterGroupViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IRegisterGroupView;
	
	public class RegisterGroupViewMediator extends SimpleMediator
	{
		[Inject] public var view:IRegisterGroupView;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(RegisterGroupViewBase.SUBMIT_BUTTON_CLICKED, onSubmitButtonClicked);
			addViewListener(RegisterGroupViewBase.CANCEL_BUTTON_CLICKED, onCancelButtonClicked);
			
			addContextListener(RegisterGroupEvent.GROUP_REGISTERED, onGroupRegistered);
		}
		
		//------------------------
		// View Event handlers
		//------------------------
		private function onSubmitButtonClicked(event:Event):void{
			dispatch(new RegisterGroupEvent(RegisterGroupEvent.REGISTER_GROUP, view.code));
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