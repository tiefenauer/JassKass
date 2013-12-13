/**
 * JassPenaltyViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassScoreViewBase;
	import info.tiefenauer.jasskass.jass.views.phone.JassScoreView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for JassPenaltyView 
	 * @author Daniel Tiefenauer
	 */
	public class JassScoreViewMediator extends Mediator
	{
		[Inject] public var view:JassScoreView;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function initialize():void{
			addViewListener(JassScoreViewBase.FLIP, onFlip);
			addContextListener(JassProxyEvent.CURRENT_STRICHE_CHANGED, onStricheChanged);
			
			view.jass = jassProxy.currentJass;
		}
		
		//---------------------------
		// Event handlers
		//---------------------------
		private function onFlip(event:Event):void{
			dispatch(new JassEvent(JassEvent.HIDE_SCORE));
		}
		private function onStricheChanged(event:Event):void{
			view.jassTafel.team1Score += jassProxy.currentJass.team1Score;
			view.jassTafel.team2Score += jassProxy.currentJass.team2Score;
		}
	}
}