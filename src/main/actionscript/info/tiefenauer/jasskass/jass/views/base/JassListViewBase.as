/**
 * JassListViewBase
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	/**
	 * Base Class for JassListViews 
	 * @author Daniel Tiefenauer
	 */
	public class JassListViewBase extends MobileView
	{
		public static const NAME:String = 'JassListViewBase';
		// Event types
		public static const NEW_JASS_BUTTON_CLICKED:String = NAME + 'NewJassButtonClicked';
		public static const JASS_SELECTED:String = NAME + 'JassSelected';
		public static const FILTER_SELECTED:String = NAME + 'SortCritChanged';
		public static const REGISTER_GROUP_BUTTON_CLICKED:String = NAME + 'RegisterGroupButtonSelected';
		public static const REFRESH_BUTTON_CLICKED:String = NAME + 'RefreshButtonSelected';
		
		
		//-----------------------------
		// Getter/Setter
		//-----------------------------
		[Bindable]
		public function get jassListDataProvider():ArrayCollection{
			if (data is ArrayCollection)
				return data as ArrayCollection;
			return null;
		}
		public function set jassListDataProvider(value:ArrayCollection):void{
			data = value;
		}

	}
}