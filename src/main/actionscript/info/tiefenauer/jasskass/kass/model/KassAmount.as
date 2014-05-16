/**
 * KassAmount.as
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
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;
	
	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassAmount implements IKassAmount
	{
		private var _id:String;
		private var _player:IJassPlayer;
		private var _value:Number;

		//------------------------------------------
		// Getter/Setter
		//------------------------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get player():IJassPlayer{
			return _player;
		}
		public function set player(value:IJassPlayer):void{
			_player = value;
		}
		public function get value():Number{
			return _value;
		}
		public function set value(val:Number):void{
			_value = val;
		}
	}
}