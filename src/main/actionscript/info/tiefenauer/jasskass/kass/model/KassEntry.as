/**
 * KassEntry.as
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
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * 
	 * @author dtie
	 */
	public class KassEntry implements IKassEntry
	{
		private var _id:String;
		private var _isSynced:Boolean = false;
		private var _date:Date;
		private var _amounts:Vector.<IKassAmount> = new Vector.<IKassAmount>();
		
		/**
		 * 
		 * @param value
		 */
		public function addAmount(value:IKassAmount):void{
			var result:Vector.<IKassAmount> = _amounts.filter(function(item:IKassAmount, index:int, vector:Vector.<IKassAmount>):Boolean{
				return item.player.id == value.player.id;
			});
			if (result.length == 0)
				_amounts.push(value);
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get totalAmount():Number{
			var total:Number = 0;
			_amounts.forEach(function(item:IKassAmount, index:int, vector:Vector.<IKassAmount>):void{
				total += item.value;
			});
			return total;
		}
		
		//----------------------------------
		// Getter/Setter
		//----------------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get isSynced():Boolean{
			return _isSynced;
		}
		public function set isSynced(value:Boolean):void{
			_isSynced = value;
		}
		public function get date():Date{
			return _date;
		}
		public function set date(value:Date):void{
			_date = value;
		}
		public function get amounts():Vector.<IKassAmount>{
			return _amounts;
		}
	}
}