package info.tiefenauer.jasskass.addon.balance.views.interfaces
{
	import info.tiefenauer.jasskass.addon.balance.model.interfaces.IBalance;

	public interface IBalanceView
	{
		function get balance():IBalance;
		function set balance(value:IBalance):void;
	}
}