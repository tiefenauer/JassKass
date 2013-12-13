/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;

	public interface IJassGameView
	{
		function get game():IJassGame;
		function set game(value:IJassGame):void;
	}
}