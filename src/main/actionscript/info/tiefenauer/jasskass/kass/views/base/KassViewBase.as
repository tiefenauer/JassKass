package info.tiefenauer.jasskass.kass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	public class KassViewBase extends MobileView
	{
		private static const NAME:String = 'KassViewBase';
		// event types
		public static const FILTER_SELECTED:String = NAME + 'SortCritChanged';
		public static const JASS_SELECTED:String = NAME + 'JassSelected';
		
	}
}