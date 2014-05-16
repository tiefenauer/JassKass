/**
 * JassViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.util.toast;
	import info.tiefenauer.jasskass.app.util.translate;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassGameViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassGameView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for IIassViews 
	 * @author Daniel Tiefenauer
	 */
	public class JassGameViewMediator extends Mediator
	{
		[Inject] public var view:IJassGameView;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function initialize():void{
			addViewListener(JassGameViewBase.POINTS_ENTERED, onPointsEntered);
			addViewListener(JassGameViewBase.WYS_ENTERED, onWysEntered);
			addViewListener(JassGameViewBase.FLIP_BOARD_BUTTON_CLICKED, onFlipBoardClicked);
			addViewListener(JassGameViewBase.SPONGE_CLICKED, onSpongeClicked);
			
			addContextListener(JassProxyEvent.NEW_GAME, onNewGame);
			addContextListener(JassProxyEvent.CURRENT_GAME_CHANGED, onCurrentGameChanged);
			addContextListener(PenaltyEvent.BERGPREIS, onBergpreis);
			addContextListener(PenaltyEvent.SIEG, onSieg);
			view.game = jassProxy.currentJass.currentGame;
		}
		
		//-----------------------------
		// View Event handlers
		//-----------------------------
		private function onPointsEntered(event:Event):void{
			dispatch(new PointsEvent(PointsEvent.ADD_POINTS, view.team1points, view.team2points, view.factor));
			view.game = jassProxy.currentJass.currentGame;
		}
		private function onWysEntered(event:Event):void{
			dispatch(new WysEvent(WysEvent.WYS, view.wysTarget, view.wyses, view.factor));
			view.game = jassProxy.currentJass.currentGame;
		}
		private function onFlipBoardClicked(event:Event):void{
			dispatch(new JassEvent(JassEvent.SHOW_PENALTY));
		}
		private function onSpongeClicked(event:Event):void{
			dispatch(new JassEvent(JassEvent.FINISH_JASS, jassProxy.currentJass));
		}

		//-----------------------------
		// Context Event handlers
		//-----------------------------
		private function onNewGame(event:JassProxyEvent):void{
			view.team1points = 0;
			view.team2points = 0;
		}
		private function onCurrentGameChanged(event:JassProxyEvent):void{
			view.game = jassProxy.currentJass.currentGame;
		}
		private function onBergpreis(event:PenaltyEvent):void{
			toast(event.team.player1.firstName + ' ' + translate('und') + ' ' + event.team.player2.firstName + ' ' + translate('haben den Bergpreis geholt'));
		}
		private function onSieg(event:PenaltyEvent):void{
			toast(event.team.player1.firstName + ' ' + translate('und') + ' ' + event.team.player2.firstName + ' ' + translate('haben den Sieg geholt'));			
		}

			
	}
}