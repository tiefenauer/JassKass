/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	public interface IJassTeamProxy
	{
		function get team1():IJassTeam;
		function set team1(value:IJassTeam):void;
		
		function get team2():IJassTeam;
		function set team2(value:IJassTeam):void;
	}
}