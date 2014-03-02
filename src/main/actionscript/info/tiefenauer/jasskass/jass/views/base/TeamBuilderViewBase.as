package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * Basisklasse für TeamBuilderViews 
	 * @author Daniel
	 * 
	 */
	public class TeamBuilderViewBase extends MobileView
	{
		public static const NAME:String = 'TeamBuilderViewBase';
		// Event types
		public static const CANCEL_BUTTON_CLICKED:String = NAME + 'CancelButtonClicked';
		public static const START_BUTTON_CLICKED:String = NAME + 'StartButtonClicked';

		[Bindable] protected var _team1Player1:IJassPlayer;
		[Bindable] protected var _team1Player2:IJassPlayer;
		[Bindable] protected var _team2Player1:IJassPlayer;
		[Bindable] protected var _team2Player2:IJassPlayer;
		
		public function get team1Player1():IJassPlayer{
			return _team1Player1;
		}
		public function get team1Player2():IJassPlayer{
			return _team1Player2;
		}
		public function get team2Player1():IJassPlayer{
			return _team2Player1;
		}
		public function get team2Player2():IJassPlayer{
			return _team2Player2;
		}
		
		[Bindable]
		public function get group():IJassGroup{
			if (data is IJassGroup)
				return data as IJassGroup;
			return null;
		}
		public function set group(value:IJassGroup):void {
			data = value;
		}
	}
}