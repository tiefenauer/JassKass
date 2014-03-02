package info.tiefenauer.jasskass.profile.model
{
	import info.tiefenauer.jasskass.app.model.Actor;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	public class JassGroupProxy extends Actor implements IJassGroupProxy
	{
		private var _jassGroups:Vector.<IJassGroup> = new Vector.<IJassGroup>();
		
		//-------------------------------------
		// Public function
		//-------------------------------------
		/**
		 * Get JassGroup by ID 
		 * @param id
		 * @return 
		 */
		public function getByID(id:String):IJassGroup{
			var filterByID:Function = function(item:IJassGroup, index:int, vector:Vector.<IJassGroup>):Boolean{
				return item.id == id;
			};
			var result:Vector.<IJassGroup> = _jassGroups.filter(filterByID);
			if(result.length > 0)
				return result[0];
			return null;
		}
		
		/**
		 * Add/replace JassGroup 
		 * @param value
		 * 
		 */
		public function addJassGroup(value:IJassGroup):void{
			var existing:IJassGroup = getByID(value.id);
			if(existing)
				_jassGroups.splice(_jassGroups.indexOf(existing),1,value);
			else
				_jassGroups.push(value);
		}
		
		//-------------------------------------
		// Getter/Setter
		//-------------------------------------
		public function get jassGroups():Vector.<IJassGroup>{
			return _jassGroups;
		}
		public function get currentJassGroup():IJassGroup{
			var current:Vector.<IJassGroup> = _jassGroups.filter(function(item:IJassGroup, index:int, vector:Vector.<IJassGroup>):Boolean{
				return item.active;
			});
			if (current.length > 0)
				return current[0];
			return null;
			
		}
		public function set currentJassGroup(value:IJassGroup):void{
			_jassGroups.forEach(function(item:IJassGroup, index:int, vector:Vector.<IJassGroup>):void{
				item.active = false; 
			});
			value.active = true;
			addJassGroup(value);
		}
		
	}
}