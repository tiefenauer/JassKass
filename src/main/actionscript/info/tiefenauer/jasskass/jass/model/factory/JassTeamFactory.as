package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.vo.JassTeam;

	public class JassTeamFactory
	{
		/**
		 * 
		 * @return 
		 * 
		 */
		public static function toObject(team:IJassTeam):Object{
			var obj:Object = new Object();
			obj['player1'] = JassPlayerFactory.toObject(team.player1);
			obj['player2'] = JassPlayerFactory.toObject(team.player2);
			return obj;
		}
		
		/**
		 * 
		 * @param obj
		 * 
		 */
		public static function fromObject(obj:Object):IJassTeam{
			var team:JassTeam = new JassTeam();
			for (var key:String in obj){
				switch(key){
					case 'player1':
						team.player1 = JassPlayerFactory.fromObject(obj[key]);
						break;
					case 'player2':
						team.player2 = JassPlayerFactory.fromObject(obj[key]);
						break;
				}
			}
			return team;
		}
	}
}