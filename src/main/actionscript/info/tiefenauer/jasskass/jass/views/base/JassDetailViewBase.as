package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	/**
	 * Detail View for Jass 
	 * @author Daniel
	 */
	public class JassDetailViewBase extends MobileView
	{
		//-----------------------------
		// Getter/Setter
		//-----------------------------
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