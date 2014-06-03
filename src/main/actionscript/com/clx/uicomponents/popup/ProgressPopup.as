/**
 * ProgressPopup.as
 *
 * Project: clx-satellite
 * Date: Oct 30, 2013
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
	
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.ProgressBar;
	import spark.core.IDisplayText;
	
	/**
	 * <p>Einfaches Popup zur Anzeige eines Fortschritts</p>
	 * <p>Das Popup enthält nebst den in <code>SimplePopup</code> folgende Elemente</p>
	 * <ul>
	 * 		<li>Fortschrittsbalken (Progress Bar) mit Prozentanzeige</li>
	 * 		<li>Label für die ANzeige des momentanen Fortschrittes als Text (optional)</li>
	 * 		<li>Label für die ANzeige des totalen Fortschrittes (maximum) als Text (optional)</li>
	 * 		<li>Button zum Abbrechen</li>
	 * </ul> 
	 * @author dtie
	 * @see com.clx.uicomponents.popup.SimplePopup
	 */
	public class ProgressPopup extends SimplePopup implements ISimplePopup
	{
		// Skin parts
		[SkinPart(required="true")] public var progressBar:ProgressBar;
		[SkinPart(required="true")] public var cancelButton:Button;
		[SkinPart(required="false")] public var currentProgressLabel:IDisplayText;
		[SkinPart(required="false")] public var totalProgressLabel:IDisplayText;
		
		// constants
		/**
		 * Rückgabewert bei Klicken des Abbrechen-Buttons 
		 */
		public static const CANCEL:String = 'cancel';
		
		// public vars
		/**
		 * Beschriftung des Abbrechen-Buttons 
		 */
		[Bindable] public var cancelButtonLabel:String = 'Cancel';
		
		[Bindable] protected var _currentProgressLabel:String;
		[Bindable] protected var _totalProgressLabel:String;
		
		/**
		 * @inheritDoc 
		 */
		public function ProgressPopup(title:String=null, message:String=null){
			super(title, message);
		}
		
		/**
		 * Beschriftung für momentanen und insgesamten Fortschritt hinzufügen (falls vorhanden) 
		 * @param event
		 */
		override protected function onCreationComplete(event:FlexEvent):void{
			super.onCreationComplete(event);
			if (currentProgressLabel)
				currentProgressLabel.text = _currentProgressLabel;
			if (totalProgressLabel)
				totalProgressLabel.text = _totalProgressLabel;
		}
		
		override protected function createChildren():void{
			super.createChildren();
			title = _title;
			message = _message;
			progressBar.currentProgress = 0;
			progressBar.totalProgress = 100;
			cancelButton.addEventListener(MouseEvent.CLICK, onCancelButtonClick);
		}
		
		//--------------------------------
		// Event handlers
		//--------------------------------
		/**
		 * Benutzer hat Abbrechen-Button geklickt 
		 * @param event
		 * 
		 */
		protected function onCancelButtonClick(event:MouseEvent):void{
			close(true, CANCEL);
		}

		//--------------------------------
		// Getter/Setter
		//--------------------------------
		[Bindable]
		public function get currentProgress():String{
			return _currentProgressLabel;
		}
		public function set currentProgress(value:String):void{
			_currentProgressLabel = value;
			if (currentProgressLabel)
				currentProgressLabel.text = _currentProgressLabel;
		}
		[Bindable]
		public function get totalProgress():String{
			return _totalProgressLabel;
		}
		public function set totalProgress(value:String):void{
			_totalProgressLabel = value;
			if (totalProgressLabel)
				totalProgressLabel.text = _totalProgressLabel;
		}
			
	}
}


