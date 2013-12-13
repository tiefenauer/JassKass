/**
 * TeamBuilderViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import spark.events.PopUpEvent;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.views.base.TeamBuilderViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.ITeamBuilderView;
	import info.tiefenauer.jasskass.jass.views.phone.TeamBuilderView;
	import info.tiefenauer.jasskass.jass.views.popups.NewPlayerPopup;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for TeamBuilderView 
	 * @author Daniel Tiefenauer
	 */
	public class TeamBuilderViewMediator extends Mediator
	{
		[Inject] public var view:ITeamBuilderView;
		
		override public function initialize():void{
			addViewListener(MobileView.BACK, dispatch);
			addViewListener(TeamBuilderViewBase.PLAYER1_BUTTON_CLICKED, onPlayer1ButtonClicked);
			addViewListener(TeamBuilderViewBase.PLAYER2_BUTTON_CLICKED, onPlayer2ButtonClicked);
			addViewListener(TeamBuilderViewBase.PLAYER3_BUTTON_CLICKED, onPlayer3ButtonClicked);
			addViewListener(TeamBuilderViewBase.PLAYER4_BUTTON_CLICKED, onPlayer4ButtonClicked);
			addViewListener(TeamBuilderViewBase.DONE_BUTTON_CLICKED, onDoneButtonClicked);
			addViewListener(TeamBuilderViewBase.CANCEL_BUTTON_CLICKED, onCancelButtonClicked);
			addViewListener(TeamBuilderViewBase.START_BUTTON_CLICKED, onStartButtonClicked);
		}
		
		//---------------------------------------
		// Event handlers
		//---------------------------------------
		private function onPlayer1ButtonClicked(event:Event):void{
			showNewPlayerPopup(view.jass.team1.player1);
		}
		private function onPlayer2ButtonClicked(event:Event):void{
			showNewPlayerPopup(view.jass.team1.player2);
		}
		private function onPlayer3ButtonClicked(event:Event):void{
			showNewPlayerPopup(view.jass.team2.player1);
		}
		private function onPlayer4ButtonClicked(event:Event):void{
			showNewPlayerPopup(view.jass.team2.player2);
		}
		private function onDoneButtonClicked(event:Event):void{
			dispatch(new JassEvent(JassEvent.CREATE_JASS, view.jass));
		}
		private function onCancelButtonClicked(event:Event):void{
			dispatch(new Event(MobileView.BACK));
		}
		private function onStartButtonClicked(event:Event):void{
			dispatch(new JassEvent(JassEvent.START_JASS, view.jass));
		}
		
		//---------------------------------------
		// Private functions
		//---------------------------------------
		private function showNewPlayerPopup(player:IJassPlayer):void{
			var newPlayerPopup:NewPlayerPopup = new NewPlayerPopup();
			newPlayerPopup.addEventListener(PopUpEvent.CLOSE, onclose);
			newPlayerPopup.show(player);
		}
		private function onclose(event:PopUpEvent):void{
			var refreshView:TeamBuilderView = TeamBuilderView(view);
			switch(event.data){
				case view.jass.team1.player1:
					refreshView.player1Btn.label = event.data.firstName;
					break;
				case view.jass.team1.player2:
					refreshView.player2Btn.label = event.data.firstName;
					break;
				case view.jass.team2.player1:
					refreshView.player3Btn.label = event.data.firstName;
					break;
				case view.jass.team2.player2:
					refreshView.player4Btn.label = event.data.firstName;
					break;
			}
		}
	}
}