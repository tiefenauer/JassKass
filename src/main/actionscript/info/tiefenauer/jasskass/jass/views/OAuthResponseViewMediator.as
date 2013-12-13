/**
 * OAuthResponseViewMediator.as
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

package info.tiefenauer.jasskass.jass.views
{
	import info.tiefenauer.jasskass.jass.views.phone.OAuthResponseView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for OAuthResponseView 
	 * @author dtie
	 * 
	 */
	public class OAuthResponseViewMediator extends Mediator
	{
		[Inject] public var view:OAuthResponseView;
		
		override public function initialize():void{
		}
	}
}