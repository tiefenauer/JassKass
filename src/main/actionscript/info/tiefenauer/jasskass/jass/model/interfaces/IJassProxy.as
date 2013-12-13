/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	public interface IJassProxy
	{
		function newJass():IJass;
		
		function addPointsToCurrentGame(team:IJassTeam, points:Number):void;
		function addWysToCurrentGame(team:IJassTeam, wyses:Vector.<IWys>):void;
		function addStrichToCurrentJass(team:IJassTeam, count:Number):void;
		
		function get jassList():Vector.<IJass>;
		function get currentJass():IJass;
	}
}