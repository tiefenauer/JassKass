package info.tiefenauer.jasskass.profile.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	public class GroupCreatedViewBase extends MobileView
	{
		
		//--------------------------
		// Getter/Setter
		//--------------------------
		[Bindable]
		public function get group():IJassGroup{
			if (data is IJassGroup)
				return data as IJassGroup;
			return null;
		}
		public function set group(value:IJassGroup):void{
			data = value;
		}
	}
}