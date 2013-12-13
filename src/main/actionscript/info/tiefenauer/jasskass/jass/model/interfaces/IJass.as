/**
 * IJass.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IJSON;

	[Bindable]
	public interface IJass extends IJSON
	{
		function newGame():void;
		function newRound():void;
		
		function get currentTeam():IJassTeam;
		
		function get date():Date;
		
		function get team1():IJassTeam;
		function set team1(value:IJassTeam):void;
		function get team1Score():Number;
		function set team1Score(value:Number):void;

		function get team2():IJassTeam;
		function set team2(value:IJassTeam):void;
		function get team2Score():Number;
		function set team2Score(value:Number):void;
		
		// convenience functions
		function get currentGame():IJassGame;
		function set currentGame(value:IJassGame):void;
		function get pointsTeam1():Number;
		function get pointsTeam2():Number;
	}
}