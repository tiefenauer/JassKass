/**
 * JassPlayer.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.counter.model
{
	import info.tiefenauer.jasskass.counter.model.interfaces.IPerson;
	
	/**
	 * Base Class for Jass Players
	 * @author Daniel Tiefenauer
	 */
	public class JassPlayer implements IPerson
	{
		private var _firstName:String;
		private var _lastName:String;
		private var _eMail:String;
		
		/**
		 * Constructor 
		 * @param firstName
		 * @param lastName
		 * @param eMail
		 * 
		 */
		public function JassPlayer(firstName:String=null, lastName:String=null, eMail:String=null){
			_firstName = firstName;
			_lastName = lastName;
			_eMail = eMail;
		}
		
		public function get firstName():String{
			return _firstName;
		}
		public function set firstName(value:String):void{
			_firstName = value;
		}
		public function get lastName():String{
			return _lastName;
		}
		public function set lastName(value:String):void{
			_lastName = value;
		}
		public function get eMail():String{
			return _eMail;
		}
		public function set eMail(value:String):void{
			_eMail = value;
		}
	}
}