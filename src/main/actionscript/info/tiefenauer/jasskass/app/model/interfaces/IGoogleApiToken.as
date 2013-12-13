package info.tiefenauer.jasskass.app.model.interfaces
{
	/**
	 * Interface for GoogleAPIToken-classes 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public interface IGoogleApiToken 
	{
		function get accessToken():String;
		function set accessToken(value:String):void;
		
		function get refreshToken():String;
		function set refreshToken(value:String):void;
		
		function get timestamp():Number;
		function set timestamp(value:Number):void;
		
		function get scope():String;
		function set scope(value:String):void;
		
		function get state():String;
		function set state(value:String):void;
		
		function get expiresIn():Number;
		function set expiresIn(value:Number):void;
		
		function get isValid():Boolean;
		
		function fromObject(obj:Object):void;
		function toObject():Object;
	}
}