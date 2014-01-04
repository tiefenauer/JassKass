/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	public interface IJassProxy
	{
		function startNewGame():void;
		
		function addJass(value:IJass):void;
		function removeJass(id:String):void;

		function addPointsToCurrentGame(team:IJassTeam, points:Number):void;
		function addWysToCurrentGame(team:IJassTeam, wyses:Vector.<IWys>):void;
		function setFactorForCurrentGame(factor:Number):void;
		function addPenaltyToCurrentJass(team:IJassTeam, count:Number):void;
		
		function get jassList():Vector.<IJass>;
		
		function get currentJass():IJass;
		function set currentJass(value:IJass):void;
		
	}
}