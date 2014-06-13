package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;

	/**
	 * 
	 * @author dtie
	 */
	public class JassPlayerFactory
	{
		/**
		 * 
		 * @param obj
		 * @return 
		 * 
		 */
		public static function fromAzureObject(obj:Object):IJassPlayer{
			var player:IJassPlayer = new JassPlayer();
			for (var key:String in obj) switch (key){
				case'id':
					player.id = obj[key];
					break;
				case 'firstName':
					player.firstName = obj[key];
					break;
				case 'lastName':
					player.lastName = obj[key];
					break;
				case 'email':
					player.eMail = obj[key];
					break;
			}
			return player;
		}
		
		/**
		 * 
		 * @param player
		 * @return 
		 */
		public static function toAzureObject(player:IJassPlayer):Object{
			return {
				id: player.id || '',
				firstName: player.firstName || '',
				lastName: player.lastName || '',
				eMail: player.eMail || ''
			}
		}
	}
}