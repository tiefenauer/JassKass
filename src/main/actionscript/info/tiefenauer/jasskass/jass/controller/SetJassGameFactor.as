package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassGameEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	public class SetJassGameFactor extends SimpleCommand
	{
		[Inject] public var event:JassGameEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			jassProxy.setFactorForCurrentGame(event.factor);
		}
	}
}