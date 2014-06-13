package info.tiefenauer.jasskass.profile.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Basisklasse für ProfileViews 
	 * @author Daniel
	 */
	public class GroupBuilderViewBase extends MobileView
	{
		public var onSubmitClicked:Signal = new Signal(IJassGroup);
		
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