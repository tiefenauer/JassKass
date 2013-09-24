package info.tiefenauer.jasskass.balance.views.interfaces
{
	import info.tiefenauer.jasskass.balance.model.interfaces.IBalance;

	public interface IBalanceView
	{
		function get balance():IBalance;
		function set balance(value:IBalance):void;
	}
}