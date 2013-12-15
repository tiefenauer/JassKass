/**
 * StarJass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.phone.JassGameView;
	
	public class StartJass extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var application:JassKass;
		
		override public function execute():void{
			super.execute();
			jassProxy.currentJass = event.jass;
			event.jass.newGame();
			event.jass.newRound();
			application.activeNavigator.pushView(JassGameView, event.jass.currentGame);
		}
	}
}