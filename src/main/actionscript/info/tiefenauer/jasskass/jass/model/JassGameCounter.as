/**
 * JassCounter
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.model
{
	import info.tiefenauer.jasskass.jass.model.interfaces.ICounter;
	
	/**
	 * Class to hold points of a game 
	 * @author Daniel Tiefenauer
	 */
	public class JassGameCounter implements ICounter
	{
		public var team1PointsPlayed:Number = 0;
		public var team2PointsPlayed:Number = 0;
		
		//------------------------------
		// Getter/Setter
		//------------------------------
/*		public function get team1PointsTotal():Number{
			return _team1PointsPlayed;
		}
		public function set team1PointsTotal(value:Number):void{
			_team1PointsPlayed = value;
		}
		
		public function get team2PointsTotal():Number{
			return _team2PointsPlayed;
		}
		public function set team2PointsTotal(value:Number):void{
			_team2PointsPlayed = value;
		}*/
	}
}