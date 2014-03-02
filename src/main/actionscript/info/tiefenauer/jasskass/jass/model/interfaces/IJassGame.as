/**
 * IJassGame.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{

	[Bindable]
	public interface IJassGame 
	{
		function get jass():IJass;
		function set jass(value:IJass):void;
		
		function get factor():Number;
		function set factor(value:Number):void;
		
		function get team1PointsPlayed():Number;
		function set team1PointsPlayed(value:Number):void;
		function get team1Wyses():Vector.<IWys>;
		function get team1TotalPoints():Number;
		
		function get team2PointsPlayed():Number;
		function set team2PointsPlayed(value:Number):void;
		function get team2Wyses():Vector.<IWys>;
		function get team2TotalPoints():Number;
		
	}
}