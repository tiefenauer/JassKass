/**
 * SyncKassData.as
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
	import info.tiefenauer.jasskass.azure.service.KassService;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class SyncKassData extends SimpleCommand
	{
		[Inject] public var event:KassEvent;
		[Inject] public var kassProxy:IKassProxy;
		[Inject] public var service:KassService;
		
		private var unSynced:Vector.<IKassEntry> = new Vector.<IKassEntry>();
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			kassProxy.currentKass.entries.filter(function(item:IKassEntry, index:int, vector:Vector.<IKassEntry>):Boolean{
				return item.isSynced
			}).forEach(function(entry:IKassEntry):void{
				unSynced.push(entry);
			});
			
			detain();
			service.onSuccess.addOnce(onKassEntriesAdded);
			service.addEntries(kassProxy.currentKass, unSynced);
		}
		
		/**
		 * 
		 * @param responseObj
		 */
		private function onKassEntriesAdded(responseObj:Object):void{
			release();
			unSynced.forEach(function(entry:IKassEntry):void{
				entry.isSynced = true;
				kassProxy.addEntry(entry);
			});
		}
		
	}
}