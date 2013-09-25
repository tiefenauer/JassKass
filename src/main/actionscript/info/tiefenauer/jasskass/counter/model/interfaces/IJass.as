/**
 * IJass.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.counter.model.interfaces
{
	public interface IJass
	{
		function get date():Date;
		function get teams():Vector.<IJassTeam>;
		function get games():Vector.<IJassGame>;
	}
}