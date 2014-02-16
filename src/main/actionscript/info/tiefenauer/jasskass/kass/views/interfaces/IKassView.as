package info.tiefenauer.jasskass.kass.views.interfaces
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.IMobileView;
	import info.tiefenauer.jasskass.kass.model.interfaces.IBalance;

	public interface IKassView extends IMobileView
	{
		function get entries():ArrayCollection;
		function set entries(value:ArrayCollection):void;
		
		function get balance():IBalance;
		function set balance(value:IBalance):void;
	}
}