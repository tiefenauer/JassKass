/**
 * SettingDisplay.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.views.components
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.views.components
{
	import flash.events.Event;
	
	import mx.core.IVisualElement;
	
	import spark.components.Image;
	import spark.components.SkinnableContainer;
	import spark.core.IDisplayText;
	
	import info.tiefenauer.jasskass.skins.SettingDisplaySkin;
	
	[Event(name="settingChanged", type="flash.events.Event")]
	[Style(name="icon", type="Object", inherit="no")]

	/**
	 * 
	 * @author dtie
	 */
	public class SettingDisplay extends SkinnableContainer
	{
		[SkinPart(required="true")] public var labelDisplay:IDisplayText;
		[SkinPart(required="false")] public var valueDisplay:IVisualElement;
		[SkinPart(required="true")] public var iconDisplay:Image;
		
		private var _label:String;
		
		/**
		 * 
		 * 
		 */
		public function SettingDisplay(){
			super();
			setStyle('skinClass', SettingDisplaySkin);
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
			if (instance == labelDisplay){
				labelDisplay.text = _label;
			}
			else if (instance == iconDisplay){
				iconDisplay.source = getStyle('icon');
			}
		}
		
		protected function addHandlers():void{
			if (valueDisplay)
				valueDisplay.addEventListener(Event.CHANGE, onValueChanged);
		}
		
		protected function onValueChanged(event:Event):void{
			dispatchEvent(new Event('settingChanged'));
		}
		
		override protected function createChildren():void{
			super.createChildren();
			addHandlers();
			if (valueDisplay)
				contentGroup.addElement(valueDisplay);
		}
		
		public function set label(value:String):void{
			_label = value;
			if (labelDisplay && labelDisplay.text != value)
				labelDisplay.text = value;
		}
	}
}