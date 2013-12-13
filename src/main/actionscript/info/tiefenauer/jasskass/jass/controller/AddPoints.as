/**
 * AddPoints
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.ScoreEvent;
	import info.tiefenauer.jasskass.jass.model.enum.JassPoints;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	public class AddPoints extends SimpleCommand
	{
		[Inject] public var event:PointsEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			switch(true){
				// Match for Team 1
				case event.team1Points == JassPoints.MATCH && jassProxy.currentJass.currentTeam == jassProxy.currentJass.team1:
					dispatch(new ScoreEvent(ScoreEvent.MATCH, jassProxy.currentJass.team1));
					break;
				// Match for Team 2
				case event.team2Points == JassPoints.MATCH && jassProxy.currentJass.currentTeam == jassProxy.currentJass.team2:
					dispatch(new ScoreEvent(ScoreEvent.MATCH, jassProxy.currentJass.team2));
					break;
				// Konter-Match for Team 1
				case event.team1Points == JassPoints.MATCH && jassProxy.currentJass.currentTeam == jassProxy.currentJass.team2:
					dispatch(new ScoreEvent(ScoreEvent.KONTERMATCH, jassProxy.currentJass.team1));
					break;
				// Konter-Match for Team 2
				case event.team2Points == JassPoints.MATCH && jassProxy.currentJass.currentTeam == jassProxy.currentJass.team1:
					dispatch(new ScoreEvent(ScoreEvent.KONTERMATCH, jassProxy.currentJass.team2));
					break;
			}
			jassProxy.addPointsToCurrentGame(jassProxy.currentJass.team1, event.team1Points);
			jassProxy.addPointsToCurrentGame(jassProxy.currentJass.team2, event.team2Points);
		}
	}
}