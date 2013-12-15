/**
 * JassViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.enum.JassPoints;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassGameViewBase;
	import info.tiefenauer.jasskass.jass.views.phone.JassGameView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for IIassViews 
	 * @author Daniel Tiefenauer
	 */
	public class JassGameViewMediator extends Mediator
	{
		[Inject] public var view:JassGameView;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function initialize():void{
			addViewListener(MobileView.BACK, onBack);
			addViewListener(JassGameViewBase.POINTS_ENTERED, onPointsEntered);
			addViewListener(JassGameViewBase.WYS_ENTERED, onWysEntered);
			addViewListener(JassGameViewBase.FLIP_BOARD_BUTTON_CLICKED, onShowPenalty);
			
			addContextListener(JassProxyEvent.CURRENT_GAME_CHANGED, onCurrentGameChanged);
			
			view.game = jassProxy.currentJass.currentGame;
		}
		
		//-----------------------------
		// Event handlers
		//-----------------------------
		private function onBack(event:Event):void{
			// alert Popup zeigen
			dispatch(new JassEvent(JassEvent.FINISH_JASS));
		}
		private function onPointsEntered(event:Event):void{
			dispatch(new PointsEvent(PointsEvent.ADD_POINTS, view.team1Points, view.team2Points));
		}
		private function onWysEntered(event:Event):void{
			dispatch(new WysEvent(WysEvent.WYS, view.wysTarget, view.wyses));
		}
		private function onShowPenalty(event:Event):void{
			dispatch(new JassEvent(JassEvent.SHOW_PENALTY));
		}
		
		private function onCurrentGameChanged(event:JassProxyEvent):void{
			if (jassProxy.currentJass.team1Points < JassPoints.SIEG){
				// neues Game beginnen?
			}
			else {
				view.game = jassProxy.currentJass.currentGame;
			}
		}
	}
}