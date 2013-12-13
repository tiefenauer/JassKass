/**
 * JassListViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassListViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassListView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator for JassListView 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class JassListViewMediator extends Mediator
	{
		[Inject] public var view:IJassListView;
		[Inject] public var jassProxy:IJassProxy;
		
		private var sortFunction:Function = sortJassByDateDesc;
		
		override public function initialize():void{
			addViewListener(JassListViewBase.NEW_JASS_BUTTON_CLICKED, onNewJassButtonClicked);
			addViewListener(JassListViewBase.JASS_SELECTED, onJassSelected);
			sortJassList();
		}
		
		/**
		 * Sort list and update view 
		 */
		private function sortJassList():void{
			var ac:ArrayCollection = new ArrayCollection();
			var sortedList:Vector.<IJass> = jassProxy.jassList.sort(sortFunction);
			sortedList.forEach(function(jass:IJass, index:int, vector:Vector.<IJass>):void{ ac.addItem(jass) });
			view.jasses.dataProvider = ac;
		}
		
		//---------------------------
		// Event handlers
		//---------------------------
		private function onNewJassButtonClicked(event:Event):void{
			dispatch(new JassEvent(JassEvent.NEW_JASS));
		}
		private function onJassSelected(event:Event):void{
			dispatch(new JassEvent(JassEvent.SHOW_JASS_DETAIL, view.jasses.selectedItem));
		}
		
		//---------------------------
		// Sort functions
		//---------------------------
		private function sortJassByDateAsc(x:IJass, y:IJass):Number{
			if (x.date.time < y.date.time)
				return -1;
			if (x.date.time > y.date.time)
				return -1;
			return 0;
		}
		private function sortJassByDateDesc(x:IJass, y:IJass):Number{
			if (x.date.time > y.date.time)
				return -1;
			if (x.date.time < y.date.time)
				return -1;
			return 0;
		}
	}
}