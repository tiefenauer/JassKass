/**
 * Wys
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import info.tiefenauer.jasskass.jass.model.enum.WysType;
	import info.tiefenauer.jasskass.jass.model.enum.WysValue;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * VO for Wys 
	 * @author Daniel Tiefenauer
	 */
	public class Wys implements IWys
	{
		// private variables
		private var _type:String;
		private var _value:Number;

		/**
		 * Constructor 
		 * @param type
		 * 
		 */
		public function Wys(type:String = null){
			this.type = type;
		}
		
		//--------------------------
		// Getter/Setter
		//--------------------------
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void{
			_type = value;
			switch(type){
				case WysType.DREIBLATT:
					_value = WysValue.DREIBLATT;
					break;
				case WysType.VIERBLATT:
					_value = WysValue.VIERBLATT;
					break;
				case WysType.FUENFBLATT:
					_value = WysValue.FUENFBLATT;
					break;
				case WysType.SECHSBLATT:
					_value = WysValue.SECHSBLATT;
					break;
				case WysType.SIEBENBLATT:
					_value = WysValue.SIEBENBLATT;
					break;
				case WysType.ACHTBLATT:
					_value = WysValue.ACHTBLATT;
					break;
				case WysType.NEUNBLATT:
					_value = WysValue.NEUNBLATT;
					break;
				case WysType.VIER_GLEICHE:
					_value = WysValue.VIER_GLEICHE;
					break;
				case WysType.VIER_NEUNEN:
					_value = WysValue.VIER_NEUNEN;
					break;
				case WysType.VIER_BAUERN:
					_value = WysValue.VIER_BAUERN;
					break;
				case WysType.STOECK:
					_value = WysValue.STOECK;
					break;
			}
		}
		public function get value():Number{
			return _value;
		}
		public function set value(val:Number):void{
			_value = val;
		}
	}
}