package info.tiefenauer.jasskass.addon.profile.views.interfaces
{
	import info.tiefenauer.jasskass.addon.profile.model.interfaces.IProfile;

	public interface IProfileView
	{
		function get profile():IProfile;
		function set profile(value:IProfile):void;
	}
}