/**
 * TeamBuilderViewBas
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	/**
	 * Base class for TeamBuilderViews 
	 * @author Daniel Tiefenauer
	 */
	public class TeamBuilderViewBase extends MobileView
	{
		public static const NAME:String = 'TeamBuilderViewBase';
		// Event types
		public static const PLAYER1_BUTTON_CLICKED:String = NAME + 'Player1BtnClicked';
		public static const PLAYER2_BUTTON_CLICKED:String = NAME + 'Player2BtnClicked';
		public static const PLAYER3_BUTTON_CLICKED:String = NAME + 'Player3BtnClicked';
		public static const PLAYER4_BUTTON_CLICKED:String = NAME + 'Player4BtnClicked';
		public static const DONE_BUTTON_CLICKED:String = NAME + 'DoneButtonClicked';
		public static const CANCEL_BUTTON_CLICKED:String = NAME + 'CancelButtonClicked';
		public static const START_BUTTON_CLICKED:String = NAME + 'StartButtonClicked';
		
		[Bindable]
		public function get jass():IJass{
			if (data is IJass)
				return data as IJass;
			return null;
		}
		public function set jass(value:IJass):void {
			data = value;
		}
	}
}