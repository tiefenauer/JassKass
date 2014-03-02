package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	import info.tiefenauer.jasskass.jass.model.vo.JassGame;

	public class JassGameFactory
	{
		/**
		 * Object ==> JassGame 
		 * @param obj
		 * @return 
		 */
		public static function fromObject(obj:Object):IJassGame{
			var jassGame:JassGame = new JassGame();
			var wysObj:Object;
			var wys:IWys;
			
			for(var key:String in obj){
				switch(key){
					case 'factor':
						jassGame.factor = Number(obj[key]);
						break;
					case 'team1pointsplayed':
						jassGame.team1PointsPlayed = Number(obj[key]);
						break;
					case 'team2pointsplayed':
						jassGame.team2PointsPlayed = Number(obj[key]);
						break;
					case 'team1wyses':
						for each(wysObj in obj[key]){
							wys = WysFactory.fromObject(wysObj);
							jassGame.team1Wyses.push(wys);
						}
						break;
					case 'team2wyses':
						for each(wysObj in obj[key]){
							wys = WysFactory.fromObject(wysObj);
							jassGame.team2Wyses.push(wys);
						}
						break;
				}
			}

			return jassGame;
		}
		
		public static function toObject(game:IJassGame):Object{
			var obj:Object = new Object();
			obj['factor'] = game.factor;
			obj['team1pointsplayed'] = game.team1PointsPlayed;
			obj['team2pointsplayed'] = game.team2PointsPlayed;
			
			var wys:IWys;
			
			var wysesTeam1:Array = new Array();
			for each(wys in game.team1Wyses){
				wysesTeam1.push(WysFactory.toObject(wys));
			}
			obj['team1wyses'] = wysesTeam1;
			
			var wysesTeam2:Array = new Array();
			for each(wys in game.team2Wyses){
				wysesTeam2.push(WysFactory.toObject(wys));
			}
			obj['team2wyses'] = wysesTeam2;
			
			return obj;
		}
	}
}