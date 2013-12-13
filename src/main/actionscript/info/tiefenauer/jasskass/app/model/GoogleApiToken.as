/**
 * GoogleApiToken
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model
{
	import info.tiefenauer.jasskass.app.model.interfaces.IGoogleApiToken;
	
	/**
	 * Class representing a token received from Google 
	 * @author Daniel Tiefenauer
	 */
	public class GoogleApiToken implements IGoogleApiToken
	{
		// private variables
		private var _timestamp:Number;
		private var _accessToken:String;
		private var _refreshToken:String;
		private var _scope:String;
		private var _state:String;
		private var _expiresIn:Number;
		
		/**
		 * Constructor 
		 * @param timestamp
		 * @param accessToken
		 * @param refreshToken
		 * @param scope
		 * @param state
		 */
		public function GoogleApiToken(timestamp:Number=0, accessToken:String=null, refreshToken:String=null, scope:String=null, state:String=null, expiresIn:Number = 0){
			_timestamp = timestamp;
			_accessToken = accessToken;
			_refreshToken = refreshToken;
			_scope = scope;
			_state = state;
			_expiresIn = expiresIn;
		}
		
		//------------------------
		// Getter/Setter
		//------------------------
		/**
		 * Object ==> GoogleApiToken 
		 * @param obj
		 */
		public function fromObject(obj:Object):void{
			for (var key:String in obj){
				switch(key){
					case 'timestamp':
						_timestamp = obj[key];
						break;
					case 'expiresIn':
						_expiresIn = obj[key];
						break;
					case 'accessToken':
						_accessToken = obj[key];
						break;
					case 'refreshToken':
						_refreshToken = obj[key];
						break;
					case 'scope':
						_scope = obj[key];
						break;
					case 'state':
						_state= obj[key];
						break;
				}
			}
		}
		
		/**
		 * GoogleApiToken ==> Object 
		 * @return 
		 * 
		 */
		public function toObject():Object{
			var obj:Object = new Object();
			if (_accessToken)
				obj.accessToken = _accessToken;
			if (_refreshToken)
				obj.refreshToken = _refreshToken;
			if (_timestamp)
				obj.timestamp = _timestamp;
			if (_expiresIn)
				obj.expiresIn = _expiresIn;
			if (_state)
				obj.state = _state;
			if (_scope)
				obj.scope = _scope;
			return obj;
		}
		
		/**
		 * Check validity of token 
		 * @return 
		 * 
		 */
		public function get isValid():Boolean{
			if (!_accessToken || _accessToken.length == 0)
				return false;
			if (_timestamp == 0)
				return false;
			if (_expiresIn == 0)
				return false;
			
			var now:Date = new Date();
			var expiryDate:Date = new Date();
			expiryDate.time = _timestamp;
			
			now.setSeconds(now.getSeconds() + _expiresIn);
			return now.time < expiryDate.time; 
		}
		
		//------------------------
		// Getter/Setter
		//------------------------
		public function get accessToken():String{
			return _accessToken;
		}
		public function set accessToken(value:String):void{
			_accessToken = value;
		}
		public function get refreshToken():String{
			return _refreshToken;
		}
		public function set refreshToken(value:String):void{
			_refreshToken = value;
		}
		public function get timestamp():Number{
			return _timestamp;
		}
		public function set timestamp(value:Number):void{
			_timestamp = value;
		}
		public function get expiresIn():Number{
			return _expiresIn;
		}
		public function set expiresIn(value:Number):void{
			_expiresIn = value;
		}
		public function get scope():String{
			return _scope;
		}
		public function set scope(value:String):void{
			_scope = value;
		}
		public function get state():String{
			return _state;
		}
		public function set state(value:String):void{
			_state = value;
		}

	}
}