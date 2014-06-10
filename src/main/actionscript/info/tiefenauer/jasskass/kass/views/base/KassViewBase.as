package info.tiefenauer.jasskass.kass.views.base
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	import org.osflash.signals.Signal;
	
	public class KassViewBase extends MobileView
	{
		private static const NAME:String = 'KassViewBase';
		// event types
		public static const RELOAD_CLICKED:String = NAME + 'ReloadClicked';
		public static const FILTER_SELECTED:String = NAME + 'SortCritChanged';
		public static const KASS_ENTRY_SELECTED:String = NAME + 'JassSelected';
		
		[Bindable] protected var _entries:ArrayCollection = new ArrayCollection();
		
		public var onKassEntrySelected:Signal = new Signal(IKassEntry);
		public var onFilterSelectionChanged:Signal = new Signal(int);
		
		//------------------------
		// Getter/Setter
		//------------------------
		public function set entries(value:ArrayCollection):void{
			_entries = value;
		}
		
	}
}