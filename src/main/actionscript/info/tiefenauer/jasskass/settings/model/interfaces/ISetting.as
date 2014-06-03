package info.tiefenauer.jasskass.settings.model.interfaces
{
	/**
	 * 
	 * @author dtie
	 */
	public interface ISetting
	{
		function get key():String;
		function set key(value:String):void;
		
		function get value():*;
		function set value(value:*):void;
	}
}