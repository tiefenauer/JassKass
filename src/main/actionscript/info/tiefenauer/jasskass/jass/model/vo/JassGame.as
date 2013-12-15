/**
 * JassGame
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * VO for a single Jass Game
	 * @author Daniel Tiefenauer
	 */
	public class JassGame implements IJassGame
	{
		// private vars
		private var _jass:IJass;
		private var _factor:Number = 1;
		private var _team1PointsPlayed:Number = 0;
		private var _team2PointsPlayed:Number = 0;
		private var _team1Wyses:Vector.<IWys> = new Vector.<IWys>();
		private var _team2Wyses:Vector.<IWys> = new Vector.<IWys>();
		
		/**
		 * 
		 * @param jass
		 */
		public function JassGame(jass:IJass){
			_jass = jass;
		}
		
		/**
		 * Get Total for Team 1 
		 * @return 
		 */
		public function get team1TotalPoints():Number{
			var sum:Number = _team1PointsPlayed;
			for each(var wys:IWys in _team1Wyses){
				sum += wys.value;
			}
			return sum;
		}
		
		/**
		 * Get Total for Team 2 
		 * @return 
		 * 
		 */
		public function get team2TotalPoints():Number{
			var sum:Number = _team2PointsPlayed;
			for each(var wys:IWys in _team2Wyses){
				sum += wys.value;
			}
			return sum;
		}

		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function toObject():Object{
			var obj:Object = new Object();
			obj['factor'] = _factor;
			obj['team1pointsplayed'] = _team1PointsPlayed;
			obj['team2pointsplayed'] = _team2PointsPlayed;
			
			var wys:IWys;
			
			var wysesTeam1:Array = new Array();
			for each(wys in _team1Wyses){
				wysesTeam1.push(wys.toObject());
			}
			obj['team1wyses'] = wysesTeam1;
			
			var wysesTeam2:Array = new Array();
			for each(wys in _team2Wyses){
				wysesTeam2.push(wys.toObject());
			}
			obj['team2wyses'] = wysesTeam2;
			
			return obj;
		}
		
		/**
		 * 
		 * @param obj
		 * 
		 */
		public function fromObject(obj:Object):void{
			var wysObj:Object;
			var wys:IWys;
			
			for(var key:String in obj){
				switch(key){
					case 'factor':
						_factor = Number(obj[key]);
						break;
					case 'team1pointsplayed':
						_team1PointsPlayed = Number(obj[key]);
						break;
					case 'team2pointsplayed':
						_team2PointsPlayed = Number(obj[key]);
						break;
					case 'team1wyses':
						_team1Wyses = new Vector.<IWys>();
						for each(wysObj in obj[key]){
							wys = new Wys();
							wys.fromObject(wysObj);
							_team1Wyses.push(wys);
						}
						break;
					case 'team2wyses':
						_team2Wyses = new Vector.<IWys>();
						for each(wysObj in obj[key]){
							wys = new Wys();
							wys.fromObject(wysObj);
							_team2Wyses.push(wys);
						}
						break;
				}
			}
		}
		
		//-----------------------------
		// Getter/Setter
		//-----------------------------
		public function get jass():IJass{
			return _jass;
		}
		public function get factor():Number{
			return _factor;
		}
		public function set factor(value:Number):void{
			_factor = value;
		}
		public function get team1PointsPlayed():Number{
			return _team1PointsPlayed;
		}
		public function set team1PointsPlayed(value:Number):void{
			_team1PointsPlayed += value * _factor;
		}
		public function get team2PointsPlayed():Number{
			return _team2PointsPlayed * _factor;
		}
		public function set team2PointsPlayed(value:Number):void{
			_team2PointsPlayed += value * _factor;
		}
		public function get team1Wyses():Vector.<IWys>{
			return _team1Wyses;
		}
		public function get team2Wyses():Vector.<IWys>{
			return _team2Wyses;
		}
		
	}
}