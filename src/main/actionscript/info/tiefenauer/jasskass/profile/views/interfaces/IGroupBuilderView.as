package info.tiefenauer.jasskass.profile.views.interfaces
{
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	public interface IGroupBuilderView
	{
		function get jassGroup():IJassGroup;
		function set jassGroup(value:IJassGroup):void;
	}
}