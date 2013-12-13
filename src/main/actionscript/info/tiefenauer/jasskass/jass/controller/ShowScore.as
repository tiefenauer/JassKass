/**
 * ShowPenaltyForCurrentGame
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import spark.transitions.FlipViewTransition;
	import spark.transitions.ViewTransitionDirection;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.phone.JassScoreView;
	
	/**
	 * Show Penalty for current JassGame 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class ShowScore extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var application:JassKass;
		
		override public function execute():void{
			super.execute();
			var transition:FlipViewTransition = new FlipViewTransition();
			transition.direction = ViewTransitionDirection.LEFT;
			application.activeNavigator.pushView(JassScoreView, jassProxy.currentJass, null, transition);
		}
	}
}