package info.tiefenauer.jasskass.addon.statistics.views.interfaces
{
	import info.tiefenauer.jasskass.addon.statistics.model.interfaces.IStatistics;

	public interface IStatisticsView
	{
		function get statistics():IStatistics;
		function set statistics(value:IStatistics):void;
	}
}