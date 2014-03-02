package info.tiefenauer.jasskass.profile.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	/**
	 * Basisklasse für ProfileViews 
	 * @author Daniel
	 */
	public class GroupBuilderViewBase extends MobileView
	{
		private static const NAME:String = 'ProfileViewBase';
		// event types
		public static const SUBMIT_BUTTON_CLICKED:String = NAME + 'createGroupButtonClicked';

		//--------------------------------
		// Getter/Setter
		//--------------------------------
		[Bindable]
		public function get jassGroup():IJassGroup{
			if(data is IJassGroup)
				return data as IJassGroup;
			return null;
		}
		public function set jassGroup(value:IJassGroup):void{
			data = value;
		}
	}
}