package info.tiefenauer.jasskass.profile.views.interfaces
{
	import mx.collections.ArrayCollection;
	
	import spark.components.List;

	public interface IJassGroupListView
	{
		function get contentList():List;
		
		function get jassGroups():ArrayCollection;
		function set jassGroups(value:ArrayCollection):void;
	}
}