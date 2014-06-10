package info.tiefenauer.jasskass.app.views
{
	public interface IMobileView
	{
		function setCurrentState(stateName:String, playTransition:Boolean=true):void;
		function refresh():void;
	}
}