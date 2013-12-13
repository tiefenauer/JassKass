package info.tiefenauer.jasskass.app.views
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.TabbedViewNavigatorApplication;
	import spark.components.View;
	
	import info.tiefenauer.jasskass.app.util.translate;
	
	/**
	 * Base Class for Mobile Views 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class MobileView extends View
	{
		public static const NAME:String = 'MobileView';
		//event types
		public static const BACK:String = NAME + 'Back';
		
		protected var _backBtn:Button;
		/**
		 * Constructor 
		 */
		public function MobileView(){
			super();
			percentHeight = 100;
			percentWidth = 100;
			_backBtn = new Button();
			_backBtn.addEventListener(MouseEvent.CLICK, onBackBtnClick);
			_backBtn.label = translate('Zurück');
			_backBtn.visible = true;
			
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
			navigationContent = new Array(_backBtn);
		}
		
		private function onCreationComplete(event:FlexEvent):void {
			var tbv:Boolean = TabbedViewNavigatorApplication(FlexGlobals.topLevelApplication).tabbedNavigator.tabBar.visible;
			tabBarVisible = tbv;
		}
		
		private function onBackBtnClick(event:MouseEvent):void{
			dispatchEvent(new Event(BACK));
		}
		public function set backButtonEnabled(value:Boolean):void{
			_backBtn.visible = value;
		}
	}
}