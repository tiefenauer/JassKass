/**
 * CreateKassEntries.as
 *
 * Project: JassKass
 * Date: May 20, 2014
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
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.KassAmount;
	import info.tiefenauer.jasskass.kass.model.KassEntry;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	
	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class CreateKassEntry extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var kassProxy:IKassProxy;
		
		/**
		 * 
		 */
		override public function execute():void{
			// create entries for Team 1
			var kassEntry:IKassEntry = new KassEntry();
			var amount:IKassAmount
			amount = new KassAmount();
			amount.player = event.jass.team1.player1;
			amount.value = event.jass.team1Penalty;
			kassEntry.addAmount(amount);			
			amount = new KassAmount();
			amount.player = event.jass.team1.player2;
			amount.value = event.jass.team1Penalty;
			kassEntry.addAmount(amount);
			// create entries for Team 2
			var kassEntry:IKassEntry = new KassEntry();
			var amount:IKassAmount
			amount = new KassAmount();
			amount.player = event.jass.team2.player1;
			amount.value = event.jass.team2Penalty;
			kassEntry.addAmount(amount);			
			amount = new KassAmount();
			amount.player = event.jass.team2.player2;
			amount.value = event.jass.team2Penalty;
			kassEntry.addAmount(amount);
			
			kassProxy.currentKass.addEntry(kassEntry);
			dispatch(new KassEvent(KassEvent.SAVE_KASS_DATA));
			dispatch(new KassEvent(KassEvent.SYNC_KASS_DATA));
		}
	}
}