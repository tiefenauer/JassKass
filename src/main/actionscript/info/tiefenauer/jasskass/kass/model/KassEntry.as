package info.tiefenauer.jasskass.kass.model
{
	import info.tiefenauer.jasskass.app.util.translate;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class KassEntry implements IKassEntry
	{
		private var _date:Date;
		private var _location:String = translate('unbekannt');
		private var _total:Number = 0;
		private var _isPaid:Boolean = false;
		private var _comment:String = '';
		private var _before:Number = 0;
		private var _after:Number = 0;
		private var _jasses:Vector.<IJass> = new Vector.<IJass>();

		//-----------------------------
		// Getter/Setter
		//-----------------------------
		public function get date():Date{
			return _date;
		}
		public function set date(value:Date):void{
			_date = value;
		}
		public function get location():String{
			return _location;
		}
		public function set location(value:String):void{
			_location = value;
		}
		public function get total():Number{
			return _total;
		}
		public function set total(value:Number):void{
			_total = value;
		}
		public function get isPaid():Boolean{
			return _isPaid;
		}
		public function set isPaid(value:Boolean):void{
			_isPaid = value;
		}
		public function get comment():String{
			return _comment;
		}
		public function set comment(value:String):void{
			_comment = value;
		}
		public function get before():Number{
			return _before;
		}
		public function set before(value:Number):void{
			_before = value;
		}
		public function get after():Number{
			return _after;
		}
		public function set after(value:Number):void{
			_after = value;
		}
		public function get jasses():Vector.<IJass>{
			return _jasses;
		}
		
	}
}