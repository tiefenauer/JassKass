package info.tiefenauer.jasskass.kass.views
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.views.interfaces.IKassView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * Mediator für KassView 
	 * @author Daniel
	 */
	public class KassViewMediator extends Mediator
	{
		[Inject] public var view:IKassView;
		
		override public function initialize():void{
			super.initialize();
			addContextListener(KassEvent.DOWNLOAD_KASS_DATA_END, onDownloadKassDataEnd);
			
			dispatch(new KassEvent(KassEvent.DOWNLOAD_KASS_DATA));
		}
		
		//--------------------------
		// Private functions
		//--------------------------
		private function sort(value:Vector.<Object>):ArrayCollection{
			var ac:ArrayCollection = new ArrayCollection();
			var result:Vector.<Object> = value.sort(dateSort);
			for each(var item:Object in result) ac.addItem(item);
			return ac;
		}
		
		private function dateSort(x:Object, y:Object):Number{
			if (x['date'] < ['date'])
				return -1;
			if (x['date'] > ['date'])
				return +1;
			return 0;
		}
		
		//--------------------------
		// Context Event handlers
		//--------------------------
		/**
		 * Kass-Data wurde heruntergeladen 
		 * @param event
		 */
		private function onDownloadKassDataEnd(event:KassEvent):void{
			view.entries = sort(event.entries);
		}
			
	}
}