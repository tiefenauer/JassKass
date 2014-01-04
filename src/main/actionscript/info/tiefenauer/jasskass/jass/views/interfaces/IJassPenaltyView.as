/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;

	public interface IJassPenaltyView
	{
		function get jass():IJass;
		function set jass(value:IJass):void;
	}
}