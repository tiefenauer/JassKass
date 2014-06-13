/**
 * JassListViewBase
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Base Class for JassListViews 
	 * @author Daniel Tiefenauer
	 */
	public class JassListViewBase extends MobileView
	{
		// Signals
		public var onRefreshClicked:Signal = new Signal();
		public var onNewJassClicked:Signal = new Signal();
		public var onNewGroupClicked:Signal = new Signal();
		public var onJoinGroupClicked:Signal = new Signal(String);
		public var onFilterSelectionChanged:Signal = new Signal(int);
		public var onJassSelected:Signal = new Signal(IJass);
		
		protected var _jassGroup:IJassGroup;
		
		//-----------------------------
		// Getter/Setter
		//-----------------------------
		public function set jassGroup(value:IJassGroup):void{
			_jassGroup = value;
		}
		
		[Bindable]
		public function get jasses():ArrayCollection{
			if (data is ArrayCollection)
				return data as ArrayCollection;
			return null;
		}
		public function set jasses(value:ArrayCollection):void{
			data = value;
		}

	}
}