/**
 * JassProxy
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model
{
	import info.tiefenauer.jasskass.app.model.Actor;
	import info.tiefenauer.jasskass.app.util.toast;
	import info.tiefenauer.jasskass.app.util.translate;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	
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
		public function addJass(jass:IJass):void{
			var filterByID:Function = function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
				return item.id == jass.id;
			};
			var result:Vector.<IJass> = _jassList.filter(filterByID);
			if (result.length == 0)
				_jassList.push(jass);
			else
				_jassList.splice(_jassList.indexOf(result[0]), 1, jass);
			dispatch(new JassProxyEvent(JassProxyEvent.JASSES_CHANGED));
		}
		
		public function removeJass(id:String):void{
			var filterByID:Function = function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
				return item.id == id;
			};
			var result:Vector.<IJass> = _jassList.filter(filterByID);
			if (result.length > 0)
				_jassList.splice(_jassList.indexOf(result[0]), 1);
			dispatch(new JassProxyEvent(JassProxyEvent.JASSES_CHANGED));
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
			toast(translate('Strich für') + ' ' + team.player1.firstName + ' und ' + team.player2.firstName);
			dispatch(new JassProxyEvent(JassProxyEvent.CURRENT_STRICHE_CHANGED));
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