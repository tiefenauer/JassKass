/**
 * JassViewBase
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassGame;
	
	/**
	 * Base class for JassView 
	 * @author Daniel Tiefenauer
	 */
	public class JassGameViewBase extends MobileView
	{
		public static const NAME:String = 'JassGameViewBase';
		// event names
		public static const POINTS_ENTERED:String = NAME + 'PointsEntered';
		public static const WYS_ENTERED:String = NAME + 'WysEntered';
		public static const STOECK_ENTERED:String = NAME + 'StoeckEntered';
		public static const FLIP_BOARD_BUTTON_CLICKED:String = NAME + 'FlipButtonClicked';
		public static const FACTOR_BUTTON_CLICKED:String = NAME + 'FactorButtonClicked';
		
		//------------------------
		// Getter/Setter
		//------------------------
		[Bindable]
		public function get game():IJassGame{
			if (data is IJassGame)
				return data as IJassGame;
			return null;
		}
		public function set game(value:IJassGame):void{
			data = value;
		}
	}
}