package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;

	public interface IJassDetailView
	{
		function get jass():IJass;
		function set jass(value:IJass):void;
	}
}