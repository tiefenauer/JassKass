/**
 * SimplePopup.as
 *
 * Project: CLX.UIComponents
 * Date: Dec 4, 2013
 * 
 * @package		com.clx.uicomponents.popup
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package com.clx.uicomponents.popup
{
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Application;
	import spark.components.SkinnablePopUpContainer;
	import spark.core.IDisplayText;
	
	/**
	 * <p>Basisklasse für Popups</p>
	 * <p>Das Popup enthält folgende Elemente:</p>
	 * <ul>
	 * 		<li>Titel</li>
	 * 		<li>Message</li>
	 * </ul>  
	 * @author dtie
	 */
	public class SimplePopup extends SkinnablePopUpContainer implements ISimplePopup
	{
		/**
		 * Skin-Part für die Anzeige des Titels 
		 */
		[SkinPart] public var titleDisplay:IDisplayText;
		/**
		 * Skin-Part für die Anzeige der message 
		 */
		[SkinPart] public var messageDisplay:IDisplayText;

		[Bindable] protected var _title:String;
		[Bindable] protected var _message:String;
		
		/**
		 * Constructor 
		 * @param title Text für den Titel (optional)
		 * @param message Text für die Message (optional)
		 */
		public function SimplePopup(title:String=null, message:String=null):void{
			_title = title;
			_message = message;
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		/**
		 * Titel und Message hinzufügen 
		 * @param event
		 */
		protected function onCreationComplete(event:FlexEvent):void{
			if (titleDisplay)
				titleDisplay.text = _title;
			if (messageDisplay)
				messageDisplay.text = _message;
		}
		
		/**
		 * <p>Hilfsfunktion zum Anzeigen des Popups</p>
		 * <p>Als Parent wird immer die Applikation selber genommen, welche das Popup anzeigt. Das Popup wird mittig über der Applikation plaziert.</p> 
		 */
		public function show():void{
			try{
				var parent:Application = FlexGlobals.topLevelApplication as Application;
				if (parent.className != 'FlexUnitApplication'){
					super.open(parent, true);
					width = Math.min(screen.width, screen.height, stage.width, stage.height) * 0.8;
					PopUpManager.centerPopUp(this);
					PopUpManager.bringToFront(this);	
				}
			}
			catch(error:Error){
				trace(error);
				// we are probably in FlexUnitApplication
			}
		}
		
		//--------------------------------
		// Getter/Setter
		//--------------------------------
		[Bindable]
		public function get title():String{
			return _title;
		}
		public function set title(value:String):void{
			_title = value;
			if (titleDisplay)
				titleDisplay.text = _title;
		}
		[Bindable]
		public function get message():String{
			return _message;
		}
		public function set message(value:String):void{
			_message = value;
			if (messageDisplay)
				messageDisplay.text = _message;
		}
	}
}