/**
 * JassPlayer.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	
	/**
	 * Base Class for Jass Players
	 * @author Daniel Tiefenauer
	 */
	public class JassPlayer implements IJassPlayer
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
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function toObject():Object{
			var obj:Object = new Object();
			obj['firstname'] = _firstName;
			obj['lastname'] = _lastName;
			obj['email'] = _eMail;
			return obj;
		}
		
		/**
		 * 
		 * @param obj
		 * 
		 */
		public function fromObject(obj:Object):void{
			for(var key:String in obj){
				switch(key){
					case 'firstname':
						_firstName = obj[key];
						break;
					case 'lastname':
						_lastName = obj[key];
						break;
					case 'email':
						_eMail = obj[key];
						break;
				}
			}
		}
		
		//--------------------------
		// Getter/Setter
		//--------------------------
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