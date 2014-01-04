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
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassPenaltyView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for JassPenaltyView 
	 * @author Daniel Tiefenauer
	 */
	public class JassPenaltyViewMediator extends Mediator
	{
		[Inject] public var view:IJassPenaltyView;
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
			dispatch(new JassEvent(JassEvent.HIDE_PENALTY));
		}
		private function onStricheChanged(event:Event):void{
		}
	}
}