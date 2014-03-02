package info.tiefenauer.jasskass.profile.views.base
{
	import mx.collections.ArrayCollection;
	
	import spark.components.List;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	public class JassGroupListViewBase extends MobileView
	{
		private static const NAME:String = 'JassGroupListViewBase';
		// event types
		public static const GROUP_SELECTED:String = NAME + 'GroupSelected';
		
		public function JassGroupListViewBase(){
			data = new ArrayCollection();
		}
		
		public function get contentList():List{
			return new List();
		}
		
		//------------------------------
		// Getter/Setter
		//------------------------------
		[Bindable]
		public function get jassGroups():ArrayCollection{
			if (!data)
				data = new ArrayCollection();
			if (data is ArrayCollection)
				return data as ArrayCollection;
			return null;
		}
		public function set jassGroups(value:ArrayCollection):void{
			data = value;
		}
	}
}