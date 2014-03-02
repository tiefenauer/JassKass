package info.tiefenauer.jasskass.kass.model.interfaces
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;

	public interface IKassEntry
	{
		function get date():Date;
		function set date(value:Date):void;
		
		function get location():String;
		function set location(value:String):void;
		
		function get isPaid():Boolean;
		function set isPaid(value:Boolean):void;
		
		function get comment():String;
		function set comment(value:String):void;
		
		function get total():Number;
		function set total(value:Number):void;
		
		function get before():Number;
		function set before(value:Number):void;
		
		function get after():Number;
		function set after(value:Number):void;
		
		function get jasses():Vector.<IJass>;
	}
}