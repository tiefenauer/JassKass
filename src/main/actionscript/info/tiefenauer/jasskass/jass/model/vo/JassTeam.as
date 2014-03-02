/**
 * JassTeam.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model.vo
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	
	/**
	 * Base class for Jass team 
	 * @author Daniel Tiefenauer
	 */
	public class JassTeam implements IJassTeam
	{
		private var _player1:IJassPlayer;
		private var _player2:IJassPlayer;
		
		/**
		 * Constructor 
		 * @param player1
		 * @param player2
		 * 
		 */
		public function JassTeam(player1:JassPlayer=null, player2:JassPlayer=null){
			_player1 = player1;
			_player2 = player2;
		}
		
		//-----------------------------------
		// Getter/Setter
		//-----------------------------------
		public function get player1():IJassPlayer{
			return _player1;
		}
		public function set player1(value:IJassPlayer):void{
			_player1 = value;
		}
		public function get player2():IJassPlayer{
			return _player2;
		}
		public function set player2(value:IJassPlayer):void{
			_player2 = value;
		}
		
	}
}