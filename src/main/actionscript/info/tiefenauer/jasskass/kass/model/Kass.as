/**
 * Kass.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.model
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.model
{
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * 
	 * @author dtie
	 */
	public class Kass implements IKass
	{
		private var _id:String;
		private var _group:IJassGroup;
		private var _entries:Vector.<IKassEntry> = new Vector.<IKassEntry>();
		
		/**
		 * 
		 * @param value
		 * 
		 */
		public function addEntry(value:IKassEntry):void{
			var result:Vector.<IKassEntry> = _entries.filter(function(item:IKassEntry, index:int, vector:Vector.<IKassEntry>):Boolean{
				return item.id == value.id;
			});
			if (result.length == 0)
				_entries.push(value);
			else
				_entries.splice(_entries.indexOf(result[0]), 1, value);
		}
		
		//------------------------
		// Getter/Setter
		//------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get group():IJassGroup{
			return _group;
		}
		public function set group(value:IJassGroup):void{
			_group = value;
		}
		public function get entries():Vector.<IKassEntry>{
			return _entries;
		}
	}
}