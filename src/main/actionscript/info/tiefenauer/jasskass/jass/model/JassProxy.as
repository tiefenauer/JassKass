/**
 * JassProxy
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model
{
	import info.tiefenauer.jasskass.app.model.Actor;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.model.enum.JassPoints;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * Proxy to maintain jasses 
	 * @author Daniel Tiefenauer
	 */
	public class JassProxy extends Actor implements IJassProxy
	{
		//private vars
		private var _jassList:Vector.<IJass> = new Vector.<IJass>();
		private var _currentJass:IJass;
		
		/**
		 * Add a jass 
		 * @param jass
		 */
		public function addJass(value:IJass):void{
			var filterByID:Function = function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
				return item.id == value.id;
			};
			if (_jassList.filter(filterByID).length == 0)
				_jassList.push(value);
		}
		
		public function removeJass(id:String):void{
			
		}
		
		/**
		 * Add Points for a team to current game 
		 * @param team
		 * @param points
		 */
		public function addPointsToCurrentGame(team:IJassTeam, points:Number):void{
			switch(team){
				case _currentJass.team1:
					_currentJass.currentGame.team1PointsPlayed += points;
					if (points == JassPoints.MATCH)
						dispatch(new PenaltyEvent(PenaltyEvent.MATCH, _currentJass.team1));
					break;
				case _currentJass.team2:
					_currentJass.currentGame.team2PointsPlayed += points;
					if (points == JassPoints.MATCH)
						dispatch(new PenaltyEvent(PenaltyEvent.MATCH, _currentJass.team2));
					break;
			}
			dispatch(new JassProxyEvent(JassProxyEvent.CURRENT_GAME_CHANGED));
			checkStrichEvent();
		}
		
		/**
		 * ADd Wyses to current game
		 * @param team
		 * @param wyses
		 * 
		 */
		public function addWysToCurrentGame(team:IJassTeam, wyses:Vector.<IWys>):void{
			var wys:IWys;
			switch(team){
				case _currentJass.team1:
					for each(wys in wyses){
						_currentJass.currentGame.team1Wyses.push(wys);
					}
					break;
				case _currentJass.team2:
					for each(wys in wyses){
						_currentJass.currentGame.team2Wyses.push(wys);
					}
					break;
			}
			dispatch(new JassProxyEvent(JassProxyEvent.CURRENT_GAME_CHANGED));
			checkStrichEvent();
		}
		
		public function setFactorForCurrentGame(factor:Number):void{
			_currentJass.currentGame.factor = factor;
			dispatch(new JassProxyEvent(JassProxyEvent.CURRENT_GAME_CHANGED));
		}
		
		public function startNewGame():void{
			_currentJass.newGame();
			dispatch(new JassProxyEvent(JassProxyEvent.NEW_GAME));
		}
		
		public function addPenaltyToCurrentJass(team:IJassTeam, count:Number):void{
			switch(team){
				case _currentJass.team1:
					_currentJass.team1Penalty += count;
					break;
				case _currentJass.team2:
					_currentJass.team2Penalty += count;
					break;
			}
			dispatch(new JassProxyEvent(JassProxyEvent.CURRENT_STRICHE_CHANGED));
		}

		
		/**
		 * Check if a Strich is happening 
		 */
		private function checkStrichEvent():void{
			switch(true){
				case _currentJass.currentGame.team1TotalPoints >= JassPoints.BERGPREIS:
					dispatch(new PenaltyEvent(PenaltyEvent.BERGPREIS, _currentJass.team1));
					break;
				case _currentJass.currentGame.team2TotalPoints >= JassPoints.BERGPREIS:
					dispatch(new PenaltyEvent(PenaltyEvent.BERGPREIS, _currentJass.team2));
					break;
				case _currentJass.currentGame.team1TotalPoints >= JassPoints.SIEG:
					dispatch(new PenaltyEvent(PenaltyEvent.SIEG, _currentJass.team1));
					break;
				case _currentJass.currentGame.team2TotalPoints >= JassPoints.SIEG:
					dispatch(new PenaltyEvent(PenaltyEvent.SIEG, _currentJass.team2));
			}
		}
		
		//-----------------
		// Getter/Setter
		//-----------------
		public function get jassList():Vector.<IJass>{
			return _jassList;
		}
		public function get currentJass():IJass{
			return _currentJass;
		}
		public function set currentJass(value:IJass):void{
			_currentJass = value;
		}
	}
}