package info.tiefenauer.jasskass.app.views
{
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class SimpleMediator extends Mediator
	{
		[Inject] public var app:JassKass;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(MobileView.BACK, onBack);
		}
		
		//----------------------------
		// Event handlers
		//----------------------------
		protected function onBack(event:Event):void{
			app.activeNavigator.popView();
		}
	}
}