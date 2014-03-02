package info.tiefenauer.jasskass.profile.model.interfaces
{
	public interface IJassGroupProxy
	{
		function getByID(id:String):IJassGroup;
		function addJassGroup(value:IJassGroup):void;
		
		function get jassGroups():Vector.<IJassGroup>;
		
		function get currentJassGroup():IJassGroup;
		function set currentJassGroup(value:IJassGroup):void;
	}
}