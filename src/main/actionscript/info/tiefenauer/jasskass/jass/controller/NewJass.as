package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.views.phone.TeamBuilderView;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	public class NewJass extends SimpleCommand
	{
		[Inject] public var event:JassGroupEvent;
		[Inject] public var app:JassKass;
		[Inject] public var jassGroupProxy:IJassGroupProxy;

		override public function execute():void{
			super.execute();
			app.activeNavigator.pushView(TeamBuilderView, event.group); 
		}
	}
}