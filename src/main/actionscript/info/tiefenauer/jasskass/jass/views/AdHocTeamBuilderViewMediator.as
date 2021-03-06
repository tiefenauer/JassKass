/**
 * TeamBuilderViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.views.base.AdHocTeamBuilderViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.IAdHocTeamBuilderView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for TeamBuilderView 
	 * @author Daniel Tiefenauer
	 */
	public class AdHocTeamBuilderViewMediator extends Mediator
	{
		[Inject] public var view:IAdHocTeamBuilderView;
		
		override public function initialize():void{
			addViewListener(MobileView.BACK, dispatch);
			addViewListener(AdHocTeamBuilderViewBase.CANCEL_BUTTON_CLICKED, onCancelButtonClicked);
			addViewListener(AdHocTeamBuilderViewBase.START_BUTTON_CLICKED, onStartButtonClicked);
		}
		
		//---------------------------------------
		// Event handlers
		//---------------------------------------
		private function onCancelButtonClicked(event:Event):void{
			dispatch(new Event(MobileView.BACK));
		}
		private function onStartButtonClicked(event:Event):void{
			view.jass.team1.player1.firstName = view.player1Name;
			view.jass.team1.player2.firstName = view.player2Name;
			view.jass.team2.player1.firstName = view.player3Name;
			view.jass.team2.player2.firstName = view.player4Name;
				
			dispatch(new JassEvent(JassEvent.START_JASS, view.jass));
		}
		
	}
}