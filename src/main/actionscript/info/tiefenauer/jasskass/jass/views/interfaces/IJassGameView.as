/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;

	public interface IJassGameView
	{
		function get game():IJassGame;
		function set game(value:IJassGame):void;
		
		function get factor():Number;
		function get team1points():Number;
		function set team1points(value:Number):void;
		function get team2points():Number;
		function set team2points(value:Number):void;
		function get wysTarget():IJassTeam;
		function get wyses():Vector.<IWys>;
	}
}