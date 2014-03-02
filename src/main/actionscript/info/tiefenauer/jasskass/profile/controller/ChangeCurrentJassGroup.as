package info.tiefenauer.jasskass.profile.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	public class ChangeCurrentJassGroup extends SimpleCommand
	{
		[Inject] public var event:JassGroupEvent;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function execute():void{
			super.execute();
			jassGroupProxy.currentJassGroup = event.group;
			dispatch(new JassGroupProxyEvent(JassGroupProxyEvent.SAVE_JASS_GROUPS_TO_FILE));
		}
	}
}