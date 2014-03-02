/**
 * JassListViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassListViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassListView;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * Mediator for JassListView 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class JassListViewMediator extends SimpleMediator
	{
		[Inject] public var view:IJassListView;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;

		override public function initialize():void{
			addViewListener(JassListViewBase.NEW_JASS_BUTTON_CLICKED, onNewJassButtonClicked);
			addViewListener(JassListViewBase.JASS_SELECTED, onJassSelected);
			addViewListener(JassListViewBase.FILTER_SELECTED, onFilterSelected);
			addViewListener(JassListViewBase.REGISTER_GROUP_BUTTON_CLICKED, onRegisterGroupButtonClicked);
			addViewListener(JassListViewBase.REFRESH_BUTTON_CLICKED, onRefreshButtonClicked);
			
			addContextListener(JassProxyEvent.JASSES_CHANGED, onJassesChanged);
			
			view.jassGroup = jassGroupProxy.currentJassGroup;
			view.jasses.dataProvider = sort(view.filterSelection.selectedIndex);
		}
		
		//--------------------------
		// Private functions
		//--------------------------
		private function sort(crit:Number):ArrayCollection{
			var result:Vector.<IJass> = new Vector.<IJass>();
			switch(crit){
				case 0:
					result = jassProxy.jassList.sort(sortJassByDateAsc);
					break;
				case 1:
					result = jassProxy.jassList.sort(sortJassByDateDesc);
					break;
			}
			var ac:ArrayCollection = new ArrayCollection();
			for each(var item:IJass in result) ac.addItem(item);
			return ac;
		}
		
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
		
		//---------------------------
		// View Event handlers
		//---------------------------
		private function onNewJassButtonClicked(event:Event):void{
			if (jassGroupProxy.currentJassGroup)
				dispatch(new JassGroupEvent(JassGroupEvent.NEW_JASS_WITH_GROUP, jassGroupProxy.currentJassGroup));
			else
				dispatch(new JassEvent(JassEvent.NEW_ADHOC_JASS));
		}
		private function onJassSelected(event:Event):void{
			dispatch(new JassEvent(JassEvent.SHOW_JASS_DETAIL, view.jasses.selectedItem));
		}
		private function onFilterSelected(event:Event):void{
			view.jasses.dataProvider = sort(view.filterSelection.selectedIndex);
		}
		private function onRegisterGroupButtonClicked(event:Event):void{
			app.tabbedNavigator.selectedIndex = 3;
		}
		private function onRefreshButtonClicked(event:Event):void{
			dispatch(new JassProxyEvent(JassProxyEvent.SYNC_JASSES));
		}
		
		//---------------------------
		// Contex Event handlers
		//---------------------------
		private function onJassesChanged(event:JassProxyEvent):void{
			view.jasses.dataProvider = sort(view.filterSelection.selectedIndex);
		}
	}
}