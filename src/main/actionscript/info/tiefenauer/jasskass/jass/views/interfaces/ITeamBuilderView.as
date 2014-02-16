/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;

	public interface ITeamBuilderView
	{
		function get jass():IJass;
		
		function get player1Name():String;
		function get player2Name():String;
		function get player3Name():String;
		function get player4Name():String;
	}
}