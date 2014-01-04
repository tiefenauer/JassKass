package info.tiefenauer.jasskass.jass.views
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for JassDetailView 
	 * @author Daniel
	 * 
	 */
	public class JassDetailViewMediator extends Mediator
	{
		override public function initialize():void{
			addViewListener(MobileView.BACK, dispatch);
		}
	}
}