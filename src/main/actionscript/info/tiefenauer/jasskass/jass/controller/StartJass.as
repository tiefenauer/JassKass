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
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class StartJass extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		[Inject] public var application:JassKass;
		
		override public function execute():void{
			super.execute();
			event.jass.group = jassGroupProxy.currentJassGroup;
			event.jass.newGame();
			event.jass.newRound();
			jassProxy.currentJass = event.jass;
			application.tabbedNavigator.hideTabBar(true);
			application.activeNavigator.hideActionBar(true);
			application.activeNavigator.pushView(JassGameView, event.jass.currentGame);
		}
	}
}