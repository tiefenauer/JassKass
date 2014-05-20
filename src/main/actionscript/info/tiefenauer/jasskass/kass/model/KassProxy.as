/**
 * KassProxy.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.model
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.model
{
	import info.tiefenauer.jasskass.app.model.Actor;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class KassProxy extends Actor implements IKassProxy
	{
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		private var _kasses:Vector.<IKass> = new Vector.<IKass>();
		
		/**
		 * 
		 * @param entries
		 * @param kass
		 * @return 
		 */
		public function addEntries(entries:Vector.<IKassEntry>, kass:IKass=null):void{
			if (!kass)
				kass = currentKass;
			if (kass){
				entries.forEach(function(entry:IKassEntry):void{
					kass.addEntry(entry);
				});
			}
			
		}
		public function addEntry(entry:IKassEntry, kass:IKass=null){
			if (!kass)
				kass = currentKass;
			if (kass)
				kass.addEntry(entry);
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get entries():Vector.<IKassEntry>{
			if (currentKass)
				return currentKass.entries;
			return null;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get currentKass():IKass{
			var result:Vector.<IKass> = _kasses.filter(function(item:IKass, index:int, vector:Vector.<IKass):Boolean{
				return item.group.id == jassGroupProxy.currentJassGroup.id; 
			});
			if (result.length > 0)
				return result[0];
			return null;
		}
		
		/**
		 * 
		 * @return 
		 */
		public function get kasses():Vector.<IKass>{
			return _kasses;
		}
		
	}
}