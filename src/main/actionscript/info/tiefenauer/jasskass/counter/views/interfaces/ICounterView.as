package info.tiefenauer.jasskass.counter.views.interfaces
{
	import info.tiefenauer.jasskass.counter.model.interfaces.ICounter;

	public interface ICounterView
	{
		function get counter():ICounter;
		function set counter(value:ICounter):void;
	}
}