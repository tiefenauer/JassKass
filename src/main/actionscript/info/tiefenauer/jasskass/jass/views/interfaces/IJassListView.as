/**
 * class_name
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.interfaces
{
	import spark.components.List;

	/**
	 * Interfaces for JassListViews 
	 * @author Daniel Tiefenauer
	 */
	[Bindable]
	public interface IJassListView
	{
		function get jasses():List;
	}
}