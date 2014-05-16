package info.tiefenauer.jasskass.profile.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * Basisklasse für "Mein Profil" 
	 * @author Daniel
	 */
	public class JassGroupViewBase extends MobileView
	{
		private static const NAME:String = 'ProfileViewBase';
		// event types
		public static const NEW_GROUP_BUTTON_CLICKED:String = NAME + 'NewTeamButtonClicked';
		public static const JOIN_GROUP_BUTTON_CLICKED:String = NAME + 'JoinTeamButtonClicked';
		public static const CHANGE_GROUP_BUTTON_CLICKED:String = NAME + 'ChangeTeamButtonClicked';
		public static const LEAVE_GROUP_BUTTON_CLICKED:String = NAME + 'LeaveTeamButtonClicked';
	
		//-------------------------
		// GEtter/Setter
		//-------------------------
		[Bindable]
		public function get jassGroup():IJassGroup{
			if (data is IJassGroup)
				return data as IJassGroup;
			return null;
		}
		public function set jassGroup(value:IJassGroup):void{
			data = value;
		}
		
	}
}