package info.tiefenauer.jasskass.profile.model
{
	import info.tiefenauer.jasskass.azure.model.AzureObject;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * 
	 * @author Daniel
	 * 
	 */
	public class JassGroup extends AzureObject implements IJassGroup
	{
		private var _id:String = null;
		private var _key:String = null;
		private var _groupName:String = '';
		private var _current:Boolean = false;
		private var _players:Vector.<IJassPlayer> = new Vector.<IJassPlayer>();
		
		//----------------------------
		// Getter/Setter
		//----------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get key():String{
			return _key;
		}
		public function set key(value:String):void{
			_key = value;
		}
		public function get name():String{
			return _groupName;
		}
		public function set name(value:String):void{
			_groupName = value;
		}
		public function get active():Boolean{
			return _current;
		}
		public function set active(value:Boolean):void{
			_current = value;
		}
		public function get players():Vector.<IJassPlayer>{
			return _players;
		}
	}
}