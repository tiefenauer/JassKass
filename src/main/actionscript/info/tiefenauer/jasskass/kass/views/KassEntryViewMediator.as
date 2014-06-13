/**
 * KassEntryViewMediator.as
 *
 * Project: JassKass
 * Date: Jun 11, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.views
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.views
{
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.kass.views.base.KassEntryViewBase;
	
	/**
	 * 
	 * @author dtie
	 */
	public class KassEntryViewMediator extends SimpleMediator
	{
		[Inject] public var view:KassEntryViewBase;
		
		override public function initialize():void{
			super.initialize();
			
		}
		
	}
}