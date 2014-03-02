/**
 * IJassTeam.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.interfaces
{
	[Bindable]
	public interface IJassTeam
	{
		function get player1():IJassPlayer;
		function set player1(value:IJassPlayer):void;
		
		function get player2():IJassPlayer;
		function set player2(value:IJassPlayer):void;
		
	}
}