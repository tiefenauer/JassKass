/**
 * OAuthRequestViewMediator.as
 *
 * Project: JassKass
 * Date: Sep 14, 2013
 * 
 * @package		info.tiefenauer.jasskass.addon.counter.views
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.counter.views
{
	import info.tiefenauer.jasskass.counter.views.phone.OAuthRequestView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class OAuthRequestViewMediator extends Mediator
	{
		[Inject] public var view:OAuthRequestView;
		
		override public function initialize():void{
		}
	}
}