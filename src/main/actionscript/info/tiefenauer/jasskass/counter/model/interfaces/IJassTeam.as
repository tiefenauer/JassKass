/**
 * IJassTeam.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.counter.model.interfaces
{
	import info.tiefenauer.jasskass.counter.model.JassPlayer;

	public interface IJassTeam
	{
		function get players():Vector.<JassPlayer>;
		function addPlayer(value:JassPlayer):void;
	}
}