/**
 * TeamBuilderViewBas
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	
	/**
	 * Base class for TeamBuilderViews 
	 * @author Daniel Tiefenauer
	 */
	public class TeamBuilderViewBase extends MobileView
	{
		public static const NAME:String = 'TeamBuilderViewBase';
		// Event types
		public static const DONE_BUTTON_CLICKED:String = NAME + 'DoneButtonClicked';
		public static const CANCEL_BUTTON_CLICKED:String = NAME + 'CancelButtonClicked';
		public static const START_BUTTON_CLICKED:String = NAME + 'StartButtonClicked';
		
		[Bindable] public var player1:IJassPlayer = new JassPlayer();
		[Bindable] public var player2:IJassPlayer = new JassPlayer();
		[Bindable] public var player3:IJassPlayer = new JassPlayer();
		[Bindable] public var player4:IJassPlayer = new JassPlayer();
		
		public function get player1Name():String{
			return player1.firstName;
		}
		public function get player2Name():String{
			return player2.firstName;
		}
		public function get player3Name():String{
			return player3.firstName;
		}
		public function get player4Name():String{
			return player4.firstName;
		}
		
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