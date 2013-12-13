/**
 * IJassGame.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	import info.tiefenauer.jasskass.app.model.interfaces.IJSON;

	[Bindable]
	public interface IJassGame extends IJSON
	{
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