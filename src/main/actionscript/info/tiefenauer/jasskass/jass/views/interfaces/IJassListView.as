/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	/**
	 * Interfaces for JassListViews 
	 * @author Daniel Tiefenauer
	 */
	[Bindable]
	public interface IJassListView
	{
		function set jasses(value:ArrayCollection):void;
		function set jassGroup(value:IJassGroup):void;
		function setCurrentState(stateName:String, playTransition:Boolean=true):void;
	}
}