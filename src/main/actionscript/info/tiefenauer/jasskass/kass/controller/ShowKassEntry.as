/**
 * ShowKassEntry.as
 *
 * Project: JassKass
 * Date: Jun 11, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.util.global.$;
	import info.tiefenauer.jasskass.kass.events.KassEntryEvent;
	import info.tiefenauer.jasskass.kass.views.phone.KassEntryView;
	
	/**
	 * 
	 * @author dtie
	 */
	public class ShowKassEntry extends SimpleCommand
	{
		[Inject] public var event:KassEntryEvent;
		[Inject] public var app:JassKass;
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			app.activeNavigator.pushView($(KassEntryView), event.entry);
		}
	}
}