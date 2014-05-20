package info.tiefenauer.jasskass.kass.views
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.kass.views.base.KassViewBase;
	import info.tiefenauer.jasskass.kass.views.interfaces.IKassView;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator für KassView 
	 * @author Daniel
	 */
	public class KassViewMediator extends Mediator
	{
		[Inject] public var view:IKassView;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		private var _kassEntries:Vector.<IKassEntry>;
		
		override public function initialize():void{
			super.initialize();
			addViewListener(KassViewBase.FILTER_SELECTED, onFilterSelected);
			
			addContextListener(KassEvent.DOWNLOAD_KASS_DATA_END, onDownloadKassDataEnd);
			
			var downloadEvent:KassEvent = new KassEvent(KassEvent.DOWNLOAD_KASS_DATA);
			downloadEvent.group = jassGroupProxy.currentJassGroup;
			dispatch(downloadEvent);
		}
		
		//--------------------------
		// Private functions
		//--------------------------
		private function sort(crit:Number):ArrayCollection{
			var result:Vector.<IKassEntry> = new Vector.<IKassEntry>();
			switch(crit){
				case 0:
					result = _kassEntries.sort(dateSort)
					break;
				case 1:
					result = _kassEntries.sort(amountSort)
					break;
			}
			var ac:ArrayCollection = new ArrayCollection();
			for each(var item:Object in result) ac.addItem(item);
			return ac;
		}
		
		/**
		 * Sort by Date 
		 * @param x
		 * @param y
		 * @return 
		 */
		private function dateSort(x:IKassEntry, y:IKassEntry):Number{
			if (x.date < y.date)
				return -1;
			if (x.date > y.date)
				return +1;
			return 0;
		}
		/**
		 * Sort by Amount 
		 * @param x
		 * @param y
		 * @return 
		 * 
		 */
		private function amountSort(x:IKassEntry, y:IKassEntry):Number{
			if (x.totalAmount < y.totalAmount)
				return -1;
			if (x.totalAmount > y.totalAmount)
				return +1;
			return 0;
		}
		
		//--------------------------
		// View Event handlers
		//--------------------------
		private function onFilterSelected(event:Event):void{
			view.entries = sort(view.filterSelection.selectedIndex);
		}
		
		//--------------------------
		// Context Event handlers
		//--------------------------
		/**
		 * Kass-Data wurde heruntergeladen 
		 * @param event
		 */
		private function onDownloadKassDataEnd(event:KassEvent):void{
			_kassEntries = event.kass.entries;
			view.entries = sort(view.filterSelection.selectedIndex);
		}
			
	}
}