/**
 * IJass.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	import info.tiefenauer.jasskass.azure.model.IAzureObject;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	

	[Bindable]
	public interface IJass extends IAzureObject
	{
		function get games():Vector.<IJassGame>;
		
		function addPenalty(team:IJassTeam, count:Number):void;
		
		function newGame():void;
		function newRound():void;
		
		function get id():String;
		function set id(value:String):void;
		
		function get group():IJassGroup;
		function set group(value:IJassGroup):void;
		
		function get date():Date;
		function set date(value:Date):void;
		
		function get team1():IJassTeam;
		function set team1(value:IJassTeam):void;
		
		function get team1TotalPoints():Number;
		function get team1PointsPlayed():Number;
		
		function get team1WysPoints():Number;
		function get team1Penalty():Number;
		function set team1Penalty(value:Number):void;

		function get team2():IJassTeam;
		function set team2(value:IJassTeam):void;
		
		function get team2TotalPoints():Number;
		function get team2PointsPlayed():Number;
		
		function get team2WysPoints():Number;
		function get team2Penalty():Number;
		function set team2Penalty(value:Number):void;
		
		// convenience functions
		function get currentTeam():IJassTeam;
		function get currentGame():IJassGame;
		function set currentGame(value:IJassGame):void;
	}
}
