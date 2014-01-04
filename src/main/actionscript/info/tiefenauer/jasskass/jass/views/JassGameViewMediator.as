/**
 * JassViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import spark.events.PopUpEvent;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.JassGameEvent;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassGameViewBase;
	import info.tiefenauer.jasskass.jass.views.phone.JassGameView;
	import info.tiefenauer.jasskass.jass.views.popups.GameFactorPopup;
	
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
			addViewListener(JassGameViewBase.FACTOR_BUTTON_CLICKED, onFactorButtonClicked);
			
			addContextListener(JassProxyEvent.NEW_GAME, onNewGame);
			addContextListener(JassProxyEvent.CURRENT_GAME_CHANGED, onCurrentGameChanged);
			addContextListener(PenaltyEvent.BERGPREIS, onBergpreis);
			addContextListener(PenaltyEvent.SIEG, onSieg);
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
			dispatch(new PointsEvent(PointsEvent.ADD_POINTS, view.team1Points, view.team2Points, view.factor));
		}
		private function onWysEntered(event:Event):void{
			dispatch(new WysEvent(WysEvent.WYS, view.wysTarget, view.wyses, view.factor));
		}
		private function onShowPenalty(event:Event):void{
			dispatch(new JassEvent(JassEvent.SHOW_PENALTY));
		}
		private function onFactorButtonClicked(event:Event):void{
			showFactorPopup();
		}
		
		private function onNewGame(event:JassProxyEvent):void{
			showFactorPopup();
		}
		private function onCurrentGameChanged(event:JassProxyEvent):void{
			view.game = jassProxy.currentJass.currentGame;
		}
		private function onBergpreis(event:PenaltyEvent):void{
			var team:String = '';
			if(event.team == view.game.jass.team1)
				team = 'Team 1';
			else if(event.team == view.game.jass.team2)
				team = 'Team 2';
			trace(team + ' hat den Bergpreis geholt');
		}
		private function onSieg(event:PenaltyEvent):void{
			var team:String = '';
			if(event.team == view.game.jass.team1)
				team = 'Team 1';
			else if(event.team == view.game.jass.team2)
				team = 'Team 2';
			trace(team + ' hat den Sieg geholt');
		}
		
		//----------------------------------
		// Event handlers
		//----------------------------------
		private function showFactorPopup():void{
			var factorPopup:GameFactorPopup = new GameFactorPopup();
			factorPopup.show();
			factorPopup.addEventListener(PopUpEvent.CLOSE, function(closeEvent:PopUpEvent):void{
				dispatch(new JassGameEvent(JassGameEvent.SET_FACTOR, closeEvent.data));
			});
		}
			
	}
}