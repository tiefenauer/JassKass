package info.tiefenauer.jasskass.statistics.views.interfaces
{
	import info.tiefenauer.jasskass.statistics.model.interfaces.IStatistics;

	public interface IStatisticsView
	{
		function get statistics():IStatistics;
		function set statistics(value:IStatistics):void;
	}
}