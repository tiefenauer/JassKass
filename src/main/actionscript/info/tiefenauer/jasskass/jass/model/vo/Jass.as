/**
 * Jass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import info.tiefenauer.jasskass.azure.model.AzureObject;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * 
	 * @author Daniel Tiefenauer
	 */
	[Bindable]
	public class Jass extends AzureObject implements IJass
	{
		// private vars
		private var _id:String = null;
		private var _currentTeam:IJassTeam;
		private var _date:Date;
		private var _team1:IJassTeam = new JassTeam();
		private var _team2:IJassTeam = new JassTeam();
		private var _games:Vector.<IJassGame> = new Vector.<IJassGame>();
		private var _team1Striche:Number = 0;
		private var _team2Striche:Number = 0;
		
		private var _currentGame:IJassGame;
		
		/**
		 * Constructor 
		 */
		public function Jass(){
			_date = new Date();
			_team1.player1 = new JassPlayer();
			_team1.player2 = new JassPlayer();
			_team2.player1 = new JassPlayer();
			_team2.player2 = new JassPlayer();
		}

		//---------------------------------
		// Public functions
		//---------------------------------
		/**
		 * Create new Game 
		 */
		public function newGame():void{
			var game:IJassGame = new JassGame(this);
			_currentGame = game;
			_games.push(game);
		}
		
		/**
		 * Change round 
		 */
		public function newRound():void{
			if (_currentTeam == _team1)
				_currentTeam = _team2;
			else
				_currentTeam = _team1;
		}
		
		/**
		 * Get sum for team 1
		 * @return 
		 */
		public function get team1TotalPoints():Number{
			return team1PointsPlayed + team1WysPoints;
		}
		
		/**
		 * Get sum for team 2
		 * @return 
		 */
		public function get team2TotalPoints():Number{
			return team2PointsPlayed + team2WysPoints;
		}
		
		public function get team1PointsPlayed():Number{
			var points:Number = 0;
			_games.every(function(item:IJassGame, index:int, vector:Vector.<IJassGame>):void{
				points += item.team1PointsPlayed;
			});
			return points;
		}
		public function get team2PointsPlayed():Number{
			var points:Number = 0;
			_games.every(function(item:IJassGame, index:int, vector:Vector.<IJassGame>):void{
				points += item.team2PointsPlayed;
			});
			return points;
		}
		public function get team1WysPoints():Number{
			var wysPoints:Number = 0;
			for each(var game:IJassGame in _games){
				game.team1Wyses.every(function(item:IWys, index:int, vector:Vector.<IWys>):void{
					wysPoints += item.value;
				});
			}
			return wysPoints;
		}
		public function get team2WysPoints():Number{
			var wysPoints:Number = 0;
			for each(var game:IJassGame in _games){
				game.team2Wyses.every(function(item:IWys, index:int, vector:Vector.<IWys>):void{
					wysPoints += item.value;
				});
			}
			return wysPoints;
		}
		
		//----------------------------------
		// Getter/Setter
		//----------------------------------
		public function get id():String{
			return _id;
		}
		public function set id(value:String):void{
			_id = value;
		}
		public function get date():Date{
			return _date;
		}
		public function set date(value:Date):void{
			_date = value;
		}
		public function get team1():IJassTeam{
			return _team1;
		}
		public function set team1(value:IJassTeam):void{
			_team1 = value;
		}
		public function get team2():IJassTeam{
			return _team2;
		}
		public function set team2(value:IJassTeam):void{
			_team2 = value;
		}
		public function get currentTeam():IJassTeam{
			return _currentTeam;
		}
		public function get games():Vector.<IJassGame>{
			return _games;
		}
		public function get currentGame():IJassGame{
			return _currentGame;
		}
		public function set currentGame(value:IJassGame):void{
			_currentGame = value;
		}
		public function get team1Penalty():Number{
			return _team1Striche;
		}
		public function set team1Penalty(value:Number):void{
			_team1Striche = value;
		}
		public function get team2Penalty():Number{
			return _team2Striche;
		}
		public function set team2Penalty(value:Number):void{
			_team2Striche = value;
		}

	}
}