package info.tiefenauer.jasskass.balance.views
{
	import info.tiefenauer.jasskass.balance.views.interfaces.IBalanceView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class BalanceViewMediator extends Mediator
	{
		[Inject] public var view:IBalanceView;
		
		override public function initialize():void{
			super.initialize();
			trace('Mediating BalanceHomeView');
		}
	}
}