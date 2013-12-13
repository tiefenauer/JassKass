/**
 * JassTeamProxy
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeamProxy;
	
	public class JassTeamProxy implements IJassTeamProxy
	{
		public function JassTeamProxy()
		{
		}
		
		public function get team1():IJassTeam
		{
			return null;
		}
		
		public function set team1(value:IJassTeam):void
		{
		}
		
		public function get team2():IJassTeam
		{
			return null;
		}
		
		public function set team2(value:IJassTeam):void
		{
		}
	}
}