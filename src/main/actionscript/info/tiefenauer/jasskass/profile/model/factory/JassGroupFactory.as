package info.tiefenauer.jasskass.profile.model.factory
{
	import info.tiefenauer.jasskass.app.util.str2bool;
	import info.tiefenauer.jasskass.jass.model.factory.JassPlayerFactory;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	/**
	 * JassGroupFactory 
	 * @author Daniel
	 * 
	 */
	public class JassGroupFactory
	{
		/**
		 * 
		 * @param obj
		 * @return 
		 */
		public static function fromAzureObject(obj:Object):IJassGroup{
			var group:JassGroup = new JassGroup();
			
			for(var key:String in obj) switch (key){
				case 'id':
					group.id = obj[key];
					break;
				case 'isSynced':
					group.isSynced = str2bool(obj[key]);
					break;
				case 'key':
					group.key = obj[key];
					break;
				case 'name':
					group.name = obj[key];
					break;
				case 'active':
					group.active = obj[key];
					break;
			}
			
			var playersArray:Array = obj['players'];
			for each(var playerObj:Object in playersArray){
				group.players.push(JassPlayerFactory.fromAzureObject(playerObj));
			}
			return group;
		}
		
		/**
		 * 
		 * @param group
		 * 
		 */
		public static function toAzureObject(group:IJassGroup):Object{
			var players:Array = [];
			for each(var player:IJassPlayer in group.players) players.push(JassPlayerFactory.toAzureObject(player));
			return {
				id: group.id || '',
				name: group.name || '',
				key: group.key || '',
				active: group.active || false,
				players: players || []
			};
		}
	}
}