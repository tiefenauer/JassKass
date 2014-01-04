package info.tiefenauer.jasskass.kass.views.interfaces
{
	import info.tiefenauer.jasskass.kass.model.interfaces.IBalance;

	public interface IKassView
	{
		function get balance():IBalance;
		function set balance(value:IBalance):void;
	}
}