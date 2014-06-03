/**
 * IconPopup.as
 *
 * Project: clx-satellite
 * Date: Oct 31, 2013
 * 
 * @package		com.clx.satellite.core.app.view.component.popup
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package com.clx.uicomponents.popup
{
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.utils.MultiDPIBitmapSource;

	/**
	 * <p>Einfachers Popup für Hinweise</p>
	 * <p>Das Popup enthält nebst den in <code>SimplePopup</code> folgende Elemente</p>
	 * <ul>
	 * 		<li>"OK"-Button</li>
	 * 		<li>"Abbrechen"-Button</li>
	 * </ul>
	 * <p>Die Beschriftung kann individuell gesetzt werden.</p>
	 * @author dtie
	 * @see com.clx.uicomponents.popup.SimplePopup
	 */
	public class AlertPopup extends SimplePopup implements ISimplePopup
	{
		[Embed(source="/assets/dpi120/alert_ico_info.png")]
		private var ico_info_120:Class;
		[Embed(source="/assets/dpi160/alert_ico_info.png")]
		private var ico_info_160:Class;
		[Embed(source="/assets/dpi240/alert_ico_info.png")]
		private var ico_info_240:Class;
		[Embed(source="/assets/dpi320/alert_ico_info.png")]
		private var ico_info_320:Class;
		[Embed(source="/assets/dpi480/alert_ico_info.png")]
		private var ico_info_480:Class;
		[Embed(source="/assets/dpi640/alert_ico_info.png")]
		private var ico_info_640:Class;
		
		[Embed(source="/assets/dpi120/alert_ico_warning.png")]
		private var ico_warning_120:Class;
		[Embed(source="/assets/dpi160/alert_ico_warning.png")]
		private var ico_warning_160:Class;
		[Embed(source="/assets/dpi240/alert_ico_warning.png")]
		private var ico_warning_240:Class;
		[Embed(source="/assets/dpi320/alert_ico_warning.png")]
		private var ico_warning_320:Class;
		[Embed(source="/assets/dpi480/alert_ico_warning.png")]
		private var ico_warning_480:Class;
		[Embed(source="/assets/dpi640/alert_ico_warning.png")]
		private var ico_warning_640:Class;
		
		[Embed(source="/assets/dpi120/alert_ico_error.png")]
		private var ico_error_120:Class;
		[Embed(source="/assets/dpi160/alert_ico_error.png")]
		private var ico_error_160:Class;
		[Embed(source="/assets/dpi240/alert_ico_error.png")]
		private var ico_error_240:Class;
		[Embed(source="/assets/dpi320/alert_ico_error.png")]
		private var ico_error_320:Class;
		[Embed(source="/assets/dpi480/alert_ico_error.png")]
		private var ico_error_480:Class;
		[Embed(source="/assets/dpi640/alert_ico_error.png")]
		private var ico_error_640:Class;
		
		
		
		[SkinPart(required="true")] public var okButton:Button;
		[SkinPart(required="false")] public var cancelButton:Button;
		
		// PopupTypes
		/**
		 * Typ für normales Popup (ohne Icon) 
		 */
		public static const DEFAULT:String = 'default';
		/**
		 * Typ für Infos (mit Info-Icon) 
		 */
		public static const INFO:String = 'info';
		/**
		 * Typ für Warnungen (mit Ausrufezeichen)
		 */
		public static const WARNING:String = 'warning';
		/**
		 * Typ für Fehlermeldungen (mit Fehler-Icon) 
		 */
		public static const ERROR:String = 'error';
		
		// constants
		/**
		 * Rückgabewert beim Klicken des OK-Button 
		 */
		public static const OK:String = 'ok';
		/**
		 * Rückgabewert beim Klicken des Abbrechen-Button
		 */
		public static const CANCEL:String = 'cancel';
		
		/**
		 * Popup-Typ 
		 */
		public var type:String;
		/**
		 * Definiert, ob das Popup einen "Abbrechen"-Button enthält 
		 */
		[Bindable] public var isCancelable:Boolean = true;
		/**
		 * Beschriftung für den OK-Button 
		 */
		[Bindable] public var okButtonLabel:String = 'OK';
		/**
		 * Beschriftung für den Abbrechen-Button 
		 */
		[Bindable] public var cancelButtonLabel:String = 'Cancel';
		
		/**
		 * Constructor 
		 * @param type Typ des Popups (optional)
		 * @param title Text für den Titel (optional)
		 * @param message Text für die Message (optional)
		 * 
		 */
		public function AlertPopup(type:String=DEFAULT, title:String=null, message:String=null){
			super(title, message)
			this.type = type;
		}
		
		/**
		 * Gibt das <code>source</code>-Attribut des Icons zurück, damit dieses individuell überschrieben werden kann. 
		 * @return 
		 */
		public function get iconSource():MultiDPIBitmapSource{
			var source:MultiDPIBitmapSource = new MultiDPIBitmapSource();
			switch(type){
				case INFO:
					source.source120dpi = ico_info_120;
					source.source160dpi = ico_info_160;
					source.source240dpi = ico_info_240;
					source.source320dpi = ico_info_320;
					source.source480dpi = ico_info_480;
					source.source640dpi = ico_info_640;
					break;
				case WARNING:
					source.source120dpi = ico_warning_120;
					source.source160dpi = ico_warning_160;
					source.source240dpi = ico_warning_240;
					source.source320dpi = ico_warning_320;
					source.source480dpi = ico_warning_480;
					source.source640dpi = ico_warning_640;
					break;
				case ERROR:
					source.source120dpi = ico_error_120;
					source.source160dpi = ico_error_160;
					source.source240dpi = ico_error_240;
					source.source320dpi = ico_error_320;
					source.source480dpi = ico_error_480;
					source.source640dpi = ico_error_640;
					break;
			}
			return source;
		}
		
		//--------------------------------
		// Private/Protected functions
		//--------------------------------
		override protected function createChildren():void{
			super.createChildren();
			
			okButton.addEventListener(MouseEvent.CLICK, onOkButtonClick);
			okButton.label = okButtonLabel;
			
			if (cancelButton){
				cancelButton.label = cancelButtonLabel;
				cancelButton.addEventListener(MouseEvent.CLICK, onCancelButtonClick);
			}
		}
		
		//--------------------------------
		// Event handlers
		//--------------------------------
		/**
		 * Benutzer hat "OK" geklickt 
		 * @param event
		 */
		private function onOkButtonClick(event:MouseEvent):void{
			close(true, OK);
		}
		/**
		 * Benutzer hat "Abbrechen" geklickt 
		 * @param event
		 * 
		 */
		private function onCancelButtonClick(event:MouseEvent):void{
			close(true, CANCEL);
		}
		
	}
}