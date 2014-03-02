package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.app.util.str2bool;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.vo.Jass;

	public class JassFactory
	{
		
		public static function fromObject(obj:Object):IJass{
			var jass:Jass = new Jass();
			for (var key:String in obj){
				switch(key){
					case 'id':
						jass.id = obj[key];
						break;
					case 'isSynced':
						jass.isSynced = str2bool(obj[key]);
						break;
					case 'date':
						jass.date = new Date();
						jass.date.time = Number(obj[key]);
						break;
					case 'team1':
						jass.team1 = JassTeamFactory.fromObject(obj[key]);
						break;
					case 'team2':
						jass.team2 = JassTeamFactory.fromObject(obj[key]);
						break;
					case 'team1Penalty':
						jass.team1Penalty = obj[key];
						break;
					case 'team2Penalty':
						jass.team2Penalty = obj[key];
						break;
					case 'games':
						for each(var gameObj:Object in obj[key]){
							var game:IJassGame = JassGameFactory.fromObject(gameObj);
							game.jass = jass;
							jass.games.push(game);
						}
						break;
				}
			}
			return jass;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public static function toObject(jass:IJass):Object{
			var obj:Object = new Object();
			obj['id'] = jass.id;
			obj['isSynced'] = jass.isSynced;
			obj['date'] = jass.date.time;
			obj['team1'] = JassTeamFactory.toObject(jass.team1);
			obj['team2'] = JassTeamFactory.toObject(jass.team2);
			obj['team1Penalty'] = jass.team1Penalty;
			obj['team2Penalty'] = jass.team2Penalty;
			var games:Array = new Array();
			for each(var game:IJassGame in jass.games){
				games.push(JassGameFactory.toObject(game));
			}
			obj['games'] = games;
			return obj;
		}
		
		/**
		 * AzureObject ==> Jass 
		 * @param obj
		 * @return 
		 * 
		 */
		public static function fromAzureObject(obj:Object):IJass{
			var jass:IJass = new Jass();
			for(var key:String in obj) switch(key){
				case 'id':
					jass.id = obj[key];
					break;
				case 'date':
					jass.date = new Date();
					jass.date.time = obj[key];
					break;
				case 'team1penalty':
					jass.team1Penalty = obj[key];
					break;
				case 'team2penalty':
					jass.team2Penalty = obj[key];
					break;
				case 'team1points':
					// Azure sendet das, wird aber intern berechnet
					break;
				case 'team2points':
					// Azure sendet das, wird aber intern berechnet
					break;
				case 't1p1id':
					// wird nicht aufgelöst
					break;
				case 't1p2id':
					// wird nicht aufgelöst
					break;
				case 't2p1id':
					// wird nicht aufgelöst
					break;
				case 't2p2id':
					// wird nicht aufgelöst
					break;
				case 'groupid':
					// Kommt von Azure, Wird nicht gespeichert
					break;
				
			}
			return jass;
		}
		
		/**
		 * Jass ==> AzureObject 
		 * @param jass
		 * @return 
		 * 
		 */
		public static function toAzureObject(jass:IJass):Object{
			return {
				id: jass.id || '',
				date: jass.date.time,
				t1p1id: jass.team1.player1.id || '',
				t1p2id: jass.team1.player2.id || '',
				t2p1id: jass.team2.player1.id || '',
				t2p2id: jass.team2.player2.id || '',
				team1points: jass.team1TotalPoints,
				team2points: jass.team2TotalPoints,
				team1penalty: jass.team1Penalty,
				team2penalty: jass.team2Penalty
					
			};
		}
	}
}