package info.tiefenauer.jasskass.kass.model.interfaces
{
	
	/**
	 * 
	 * @author dtie
	 */
	public interface IKassEntry
	{
		function addAmount(value:IKassAmount):void;
		
		function get id():String;
		function set id(value:String):void;
		
		function get isSynced():Boolean;
		function set isSynced(value:Boolean):void;
		
		function get date():Date;
		function set date(value:Date):void;
		
		function get amounts():Vector.<IKassAmount>;
		
		function get totalAmount():Number;
	}
}