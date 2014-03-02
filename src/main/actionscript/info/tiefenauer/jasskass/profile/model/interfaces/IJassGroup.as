package info.tiefenauer.jasskass.profile.model.interfaces
{
	import info.tiefenauer.jasskass.azure.model.IAzureObject;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;

	[Bindable]
	public interface IJassGroup extends IAzureObject
	{
		function get id():String;
		function set id(value:String):void;
		
		function get key():String;
		function set key(value:String):void;
			
		function get name():String;
		function set name(value:String):void;
		
		function get active():Boolean;
		function set active(value:Boolean):void;
		
		function get players():Vector.<IJassPlayer>;
	}
}