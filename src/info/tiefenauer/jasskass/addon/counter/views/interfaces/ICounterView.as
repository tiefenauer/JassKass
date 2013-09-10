package info.tiefenauer.jasskass.addon.counter.views.interfaces
{
	import info.tiefenauer.jasskass.addon.counter.model.interfaces.ICounter;

	public interface ICounterView
	{
		function get counter():ICounter;
		function set counter(value:ICounter):void;
	}
}