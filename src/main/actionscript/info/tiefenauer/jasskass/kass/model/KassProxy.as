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
		public function addKass(kass:IKass):void{
			var result:Vector.<IKass> = _kasses.filter(function(item:IKass, index:int, vector:Vector.<IKass>):Boolean{
				return item.id == kass.id;
			});
			if (result.length == 0)
				_kasses.push(kass);
			else
				_kasses.splice(_kasses.indexOf(result[0]), 1, kass);
		}
		
		//----------------------------
		// Getter/Setter
		//----------------------------
		public function get currentKass():IKass{
			var result:Vector.<IKass> = _kasses.filter(function(item:IKass, index:int, vector:Vector.<IKass>):Boolean{
				return item.group.id == jassGroupProxy.currentJassGroup.id; 
			});
			if (result.length > 0)
				return result[0];
			return null;
		}

		public function get kasses():Vector.<IKass>{
			return _kasses;
		}
		
	}
}