/**
 * JassTeam.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.counter.model
{
	import info.tiefenauer.jasskass.counter.model.interfaces.IJassTeam;
	
	/**
	 * Base class for Jass team 
	 * @author Daniel Tiefenauer
	 */
	public class JassTeam implements IJassTeam
	{
		private var _players:Vector.<JassPlayer> = new Vector.<JassPlayer>();
		
		/**
		 * Constructor 
		 * @param player1
		 * @param player2
		 * 
		 */
		public function JassTeam(player1:JassPlayer=null, player2:JassPlayer=null){
			_players.push(player1);
			_players.push(player2);
		}
		
		//-----------------------------------
		// Public methods
		//-----------------------------------
		public function addPlayer(value:JassPlayer):void{
			var filterByKey:Function = function(item:JassPlayer, index:int, vector:Vector.<JassPlayer>):Boolean{
				return item.firstName == value.firstName && item.lastName == value.lastName;
			};
			var result:Vector.<JassPlayer> = _players.filter(filterByKey);
			if (result.length > 0)
				_players.splice(_players.indexOf(result[0]), 1, value);
			else
				_players.push(value);
		}
		
		//-----------------------------------
		// Getter/Setter
		//-----------------------------------
		public function get players():Vector.<JassPlayer>{
			return _players;
		}
		
	}
}