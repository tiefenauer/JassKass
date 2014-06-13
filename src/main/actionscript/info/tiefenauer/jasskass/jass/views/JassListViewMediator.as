/**
 * JassListViewMediator
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.util.global.$;
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.views.base.JassListViewBase;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.events.JoinGroupEvent;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	import info.tiefenauer.jasskass.profile.views.phone.GroupBuilderView;
	
	/**
	 * Mediator for JassListView 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class JassListViewMediator extends SimpleMediator
	{
		[Inject] public var view:JassListViewBase;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;

		/**
		 * 
		 * 
		 */
		override public function initialize():void{
			view.onJassSelected.addOnce(onJassSelected);
			view.onNewJassClicked.add(onNewJassButtonClicked);
			view.onNewGroupClicked.add(onNewGroupClicked);
			view.onFilterSelectionChanged.add(onFilterSelected);
			view.onJoinGroupClicked.add(onJoinGroupClicked);
			view.onRefreshClicked.add(onRefreshButtonClicked);
			
			addContextListener(JassProxyEvent.JASSES_CHANGED, onJassesChanged);
			addContextListener(JoinGroupEvent.GROUP_JOINED, onGroupJoined);
			addContextListener(JoinGroupEvent.GROUP_NOT_FOUND, onGroupNotFound);
			
			view.jassGroup = jassGroupProxy.currentJassGroup;
			view.jasses = sort(0);
		}
		
		//--------------------------
		// Private functions
		//--------------------------
		/**
		 * 
		 * @param crit
		 * @return 
		 * 
		 */
		private function sort(crit:Number):ArrayCollection{
			var result:Vector.<IJass> = jassProxy.jassList.filter(function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
				return item.group.name == jassGroupProxy.currentJassGroup.name;
			});
			switch(crit){
				case 0:
					result = result.sort(sortJassByDateAsc);
					break;
				case 1:
					result = result.sort(sortJassByDateDesc);
					break;
			}
			var ac:ArrayCollection = new ArrayCollection();
			for each(var item:IJass in result) ac.addItem(item);
			return ac;
		}
		
		/**
		 * 
		 * @param x
		 * @param y
		 * @return 
		 * 
		 */
		private function sortJassByDateAsc(x:IJass, y:IJass):Number{
			if (x.date.time < y.date.time)
				return -1;
			if (x.date.time > y.date.time)
				return -1;
			return 0;
		}
		/**
		 * 
		 * @param x
		 * @param y
		 * @return 
		 * 
		 */
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
		private function onNewJassButtonClicked():void{
			if (jassGroupProxy.currentJassGroup)
				dispatch(new JassGroupEvent(JassGroupEvent.NEW_JASS_WITH_GROUP, jassGroupProxy.currentJassGroup));
			else
				dispatch(new JassEvent(JassEvent.NEW_ADHOC_JASS));
		}
		private function onNewGroupClicked():void{
			app.activeNavigator.pushView($(GroupBuilderView), new JassGroup());
		}
		private function onJassSelected(jass:IJass):void{
			dispatch(new JassEvent(JassEvent.SHOW_JASS_DETAIL, jass));
		}
		private function onFilterSelected(selectedIndex:int):void{
			view.jasses = sort(selectedIndex);
		}
		private function onJoinGroupClicked(groupCode:String):void{
			dispatch(new JoinGroupEvent(JoinGroupEvent.JOIN_GROUP, groupCode));
		}
		private function onRefreshButtonClicked():void{
			dispatch(new JassProxyEvent(JassProxyEvent.SYNC_JASSES));
		}
		
		//---------------------------
		// Contex Event handlers
		//---------------------------
		private function onJassesChanged(event:JassProxyEvent):void{
			view.jasses = sort(0);
		}
		private function onGroupJoined(event:JoinGroupEvent):void{
			view.jassGroup = jassGroupProxy.currentJassGroup;
		}
		private function onGroupNotFound(event:JoinGroupEvent):void{
			view.setCurrentState('notJoined');
		}
	}
}