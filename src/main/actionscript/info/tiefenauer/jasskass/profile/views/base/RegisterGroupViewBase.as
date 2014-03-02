package info.tiefenauer.jasskass.profile.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	public class RegisterGroupViewBase extends MobileView
	{
		private static const NAME:String = 'RegisterGroupViewBase';
		// event types
		public static const SUBMIT_BUTTON_CLICKED:String = NAME + 'SubmitButtonClicked';
		public static const CANCEL_BUTTON_CLICKED:String = NAME + 'CancelButtonClicked';
		
		//------------------------
		// Getter/Setter
		//------------------------
		[Bindable]
		public function get code():String{
			if (data is String)
				return data as String;
			return null;
		}
		public function set code(value:String):void{
			data = value;
		}
	}
}