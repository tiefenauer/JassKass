/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import spark.components.ButtonBar;
	import spark.components.List;
	
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	/**
	 * Interfaces for JassListViews 
	 * @author Daniel Tiefenauer
	 */
	[Bindable]
	public interface IJassListView
	{
		function get filterSelection():ButtonBar;
		function set jassGroup(value:IJassGroup):void;
		function get jasses():List;
		function get groupKey():String;
		function setCurrentState(stateName:String, playTransition:Boolean=true):void;
	}
}