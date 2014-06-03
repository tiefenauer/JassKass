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
		
		function get value():String;
		function set value(value:String):void;
	}
}