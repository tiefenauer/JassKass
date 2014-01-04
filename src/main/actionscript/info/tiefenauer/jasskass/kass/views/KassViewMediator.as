package info.tiefenauer.jasskass.kass.views
{
	import info.tiefenauer.jasskass.kass.views.interfaces.IKassView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class KassViewMediator extends Mediator
	{
		[Inject] public var view:IKassView;
		
		override public function initialize():void{
			super.initialize();
			trace('Mediating BalanceHomeView');
		}
	}
}