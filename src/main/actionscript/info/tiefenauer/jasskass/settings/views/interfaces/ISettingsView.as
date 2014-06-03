package info.tiefenauer.jasskass.settings.views.interfaces
{
	import info.tiefenauer.jasskass.settings.model.interfaces.ISetting;

	/**
	 * 
	 * @author dtie
	 */
	public interface ISettingsView
	{
		function get settings():Vector.<ISetting>;
	}
}