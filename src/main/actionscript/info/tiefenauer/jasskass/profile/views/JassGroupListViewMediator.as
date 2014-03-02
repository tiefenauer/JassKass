package info.tiefenauer.jasskass.profile.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	import info.tiefenauer.jasskass.profile.views.base.JassGroupListViewBase;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupListView;
	
	public class JassGroupListViewMediator extends SimpleMediator
	{
		[Inject] public var view:IJassGroupListView;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(JassGroupListViewBase.GROUP_SELECTED, onGroupSelected);
				
			for each(var group:IJassGroup in jassGroupProxy.jassGroups) view.jassGroups.addItem(group);
		}
		
		//----------------------------
		// View event handlers
		//----------------------------
		private function onGroupSelected(event:Event):void{
			dispatch(new JassGroupEvent(JassGroupEvent.CHANGE_CURRENT_GROUP, view.contentList.selectedItem))
			app.activeNavigator.popView();
		}
	}
}