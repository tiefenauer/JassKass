package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;

	public class JassPlayerFactory
	{
		public static function toObject(player:IJassPlayer):Object{
			return {
				first: player.firstName || '',
				last: player.lastName || '',
				email: player.eMail || ''
			};
		}
		
		public static function fromObject(obj:Object):IJassPlayer{
			var player:IJassPlayer = new JassPlayer();
			for (var key:String in obj) switch (key){
				case'id':
					player.id = obj[key];
					break;
				case 'first':
					player.firstName = obj[key];
					break;
				case 'last':
					player.lastName = obj[key];
					break;
				case 'email':
					player.eMail = obj[key];
					break;
			}
			return player;
		}
	}
}