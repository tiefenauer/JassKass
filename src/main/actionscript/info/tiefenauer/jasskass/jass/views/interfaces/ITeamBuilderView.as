package info.tiefenauer.jasskass.jass.views.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	public interface ITeamBuilderView
	{
		function get team1Player1():IJassPlayer;
		function get team1Player2():IJassPlayer;
		function get team2Player1():IJassPlayer;
		function get team2Player2():IJassPlayer;
		
		function get group():IJassGroup;
		function set group(value:IJassGroup):void;
	}
}