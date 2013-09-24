package info.tiefenauer.jasskass.profile.views.interfaces
{
	import info.tiefenauer.jasskass.profile.model.interfaces.IProfile;

	public interface IProfileView
	{
		function get profile():IProfile;
		function set profile(value:IProfile):void;
	}
}