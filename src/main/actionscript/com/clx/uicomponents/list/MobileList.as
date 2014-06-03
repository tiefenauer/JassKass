/**
 * MobileList.as
 *
 * Project: CLX.UIComponents
 * Date: Jul 1, 2013
 * 
 * @package		com.clx.satellite.core.app.view.component
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 */
package com.clx.uicomponents.list
{
	
	import com.clx.uicomponents.list.callout.MobileListCallout;
	import com.clx.uicomponents.list.event.MobileListCalloutEvent;
	import com.clx.uicomponents.list.interfaces.IPullDownToRefreshGroup;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.core.mx_internal;
	import mx.effects.Move;
	import mx.events.PropertyChangeEvent;
	
	import spark.components.List;
	import spark.events.IndexChangeEvent;
	import spark.events.PopUpEvent;
	
	use namespace mx_internal;
	
	[Event(name="iconClicked", type="flash.events.Event")]
	[Event(name="decoratorClicked", type="flash.events.Event")]
	[Event(name="labelClicked", type="flash.events.Event")]
	[Event(name="messageClicked", type="flash.events.Event")]
	[Event(name="readyToRefreshStart", type="flash.events.Event")]
	[Event(name="readyToRefreshStop", type="flash.events.Event")]
	[Event(name="refreshing", type="flash.events.Event")]
	
	/**
	 * <p>Erweiterte Liste für Mobile-Geräte</p>
	 * <p>Die <code>MobileList</code> erweitert die <code>spark.components.List</code>-Klasse um folgende Funktionalitäten:</p>
	 * <ul>
	 * 		<li>Icons der Listenelemente sind klickbar (übersteuert das Verhalten bei normaler Selektion) * </li>
	 * 		<li>Decorators der Listenelemente sind klickbar (übersteuert das Verhalten bei normaler Selektion) * </li>
	 * 		<li>Label der Listenelemente sind klickbar (übersteuert das Verhalten bei normaler Selektion) * </li>
	 * 		<li>Message der Listenelemente sind klickbar (übersteuert das Verhalten bei normaler Selektion) * </li>
	 * 		<li>Listenelemente können geswiped werden * </li>
	 * 		<li>Callout für Listenelemente bei langem Tap auf Listenelement * </li>
	 * 		<li>"Pull down to refresh": Anzeige eines Spinners bei genügend weitem herabziehen der Liste * </li>
	 * </ul>
	 * <p>*Dieses Feature steht nur zu Verfügung, wenn zum Rendern des Listenitems ein <code>com.clx.uicomponents.list.MobileIconItemRenderer</code> 
	 * verwendet wird. Mit den Standard-Itemrenderer aus Flex (<code>spark.components.IconItemRenderer</code> oder <code>spark.components.LabelItemRenderer</code>)
	 * funktionieren diese Features nicht und werden ignoriert</p>
	 * 
	 * @see spark.components.List
	 * @see com.clx.uicomponents.list.MobileIconItemRenderer
	 * @see http://flexponential.com/2009/12/20/disable-selection-on-some-items-in-a-spark-list Beispiel für eine Liste mit Gruppen und verschiebbaren Elementen
	 * @see http://flexponential.com/2011/06/21/using-drag-and-drop-with-a-spark-list-in-a-mobile-flex-application Beispiel für eine Liste mit Verschiebbaren Listenelementen
	 * @see http://mobile.dzone.com/news/swipe-mobile-items-flex Beispiel für Swipable ItemRenderer 
	 */
	public class MobileList extends List
	{
		public static const NAME:String = 'MobileList';

		/**
		 * Ein- oder ausschalten des "Pull down to refresh"-Features 
		 */
		public var pullDownToRefreshEnabled:Boolean;
		
		//------------------------------------
		// Private/Protected variables
		//------------------------------------
		protected var _preventSelection:Boolean;
		protected var _callout:MobileListCallout;
		protected var _preventCalloutOpening:Boolean = false;
		protected var _readyToRefresh:Boolean = false;
		protected var _refreshing:Boolean = false;
		protected var _pullDownToRefreshGroup:IPullDownToRefreshGroup;
		
		/**
		 * Constructor 
		 */
		public function MobileList(){
			addEventListener(IndexChangeEvent.CHANGE, onChange);
			addEventListener(IndexChangeEvent.CHANGING, onChanging);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		/**
		 * Event listener registrieren 
		 */
		override protected function createChildren():void{
			super.createChildren();
			addEventListener(MobileListCalloutEvent.SHOW_CALLOUT, openCallout);
			scroller.viewport.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, refreshCalloutProperties);
			dataGroup.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onDataGroupPropertyChange);
		}
		
		/**
		 * Übersteuern der Selektion
		 * @inheritDoc
		 * @see http://flexponential.com/2009/12/20/disable-selection-on-some-items-in-a-spark-list Unterdrücken der Selektierbarkeit für einzelne Renderer
		 */
		override public function setSelectedIndex(value:int, dispatchChangeEvent:Boolean=false, changeCaret:Boolean=true):void{
			if (value == selectedIndex)
				return;
			
			if (value >= 0 && value < dataProvider.length){
				var renderer:MobileIconItemRenderer = dataGroup.getElementAt(value) as MobileIconItemRenderer;
				if (renderer.selectionEnabled){
					
					if (dispatchChangeEvent)
						dispatchChangeAfterSelection = dispatchChangeEvent;
					
					_proposedSelectedIndex = value;
					invalidateProperties();
				}
			} else {
				if (dispatchChangeEvent)
					dispatchChangeAfterSelection = dispatchChangeEvent;
				
				_proposedSelectedIndex = value;
				invalidateProperties();
			}
		}
		
		/**
		 * Übersteuern der Selektion
		 * @param value
		 * @param dispatchChangeEvent
		 * @param changeCaret
		 * @see http://flexponential.com/2009/12/20/disable-selection-on-some-items-in-a-spark-list Unterdrücken der Selektierbarkeit für einzelne Renderer* 
		 */
		override mx_internal function setSelectedIndices(value:Vector.<int>, dispatchChangeEvent:Boolean=false, changeCaret:Boolean=true):void
		{
			var newValue:Vector.<int> = new Vector.<int>;
			// take out indices that are on items that have selectionEnabled=false
			
			for(var i:int = 0; i < value.length; i++)
			{
				
				var item:* = dataProvider.getItemAt(value[i]);
				
				if (item.selectionEnabled == false)
				{
					continue;
				}
				
				newValue.push(value[i]);
			}
			
			super.setSelectedIndices(newValue, dispatchChangeEvent);
		}
		
		
		//------------------------------------
		// Event handlers
		//------------------------------------
		/**
		 * <p>Setzen des Flags zum Unterdrücken der Selektion. Die Selektion wird in folgenden Fällen unterdrückt</p>
		 * <ul>
		 * 		<li>Ein Overlay wird auf dem selektierten ItemRenderer angezeigt (z.B. nach Swipe)</li>
		 * 		<li>Das Icon wurde geklickt</li>
		 * 		<li>Der Decorator wurde geklickt</li>
		 * 		<li>Der Renderer unterdrückt die Selektion von sich aus</li>
		 * 		<li>Ein Callout ist offen</li>
		 * </ul>
		 * @see #onChange()
		 * @param event 
		 */
		protected function onChanging(event:IndexChangeEvent):void{
			var source:* = dataGroup.getElementAt(selectedIndex);
			if (source is MobileIconItemRenderer){
				var renderer:MobileIconItemRenderer = MobileIconItemRenderer(source);
				//_preventSelection = source.iconClicked || source.decoratorClicked;
				
				if (renderer.STATE == MobileIconItemRenderer.OVERLAY_ACTIVE){
					_preventSelection = true;
				}
				if (renderer.iconClickable && renderer.iconClicked){
					renderer.iconClicked = false;
					_preventSelection = true;
					dispatchEvent(new Event('iconClicked'));
				}
				if (renderer.selectionEnabled && renderer.decoratorClickable && renderer.decoratorClicked){
					renderer.decoratorClicked = false;
					_preventSelection = true;
					dispatchEvent(new Event('decoratorClicked'));
				}
				if (!renderer.selectionEnabled)
					_preventSelection = true;
			}
		}
		
		/**
		 * <p>Auslösen des <code>IndexChangeEvent</code>, sofern dies nicht in der <code>onChanging()</code>-Methode unterdrückt wurde</p> 
		 * @param event
		 * @see #onChanging()
		 */
		protected function onChange(event:IndexChangeEvent):void{
			if (_preventSelection || _callout && _callout.isOpen){
				_preventSelection = false;
				event.stopImmediatePropagation();
				callLater(function():void { selectedIndex = -1;}, null);
			}
		}
		
		/**
		 * <p>Überprüfen der vertikalen Position der Listenelemente. Falls das "Pull down to refresh" Feature
		 * aktiviert ist und die für die Anzeige des Spinners benötigte Gruppe vollständig sichtbar ist, wird ein entsprechender Event ('readyToRefreshStart')
		 * ausgelöst. Der Status der Liste wechselt zu "Bereit zum Aktualisieren".</p>
		 * <p>Falls die Gruppe für die Anzeige des Spinners ganz oder teilweise verdeckt wird, wird ein entsprechender Event ausgelöst und der
		 * Status der Liste wechselt zurück zu "Nicht bereit zum Aktualisieren".</p>
		 * <p>Falls die Listenelemente im Status "BEreits zum Aktualisieren" losgelassen werden, wechselt die Liste in den Status "Aktualisiere".</p> 
		 * @param event
		 * @see #onMouseUp()
		 */
		protected function onDataGroupPropertyChange(event:PropertyChangeEvent):void{
			if (!_refreshing && _pullDownToRefreshGroup && pullDownToRefreshEnabled && event.source == event.target && event.property == "verticalScrollPosition"){
				var vScroll:Number = dataGroup.verticalScrollPosition;
				_pullDownToRefreshGroup.height = vScroll* -1;
				if(vScroll < _pullDownToRefreshGroup.minHeight * -1){
					dispatchEvent(new Event('readyToRefreshStart'));
					readyToRefresh = true;
				}
				else if(!_refreshing){
					_readyToRefresh = false;
					dispatchEvent(new Event('readyToRefreshStop'));
				}
			}
		}
		
		/**
		 * <p>Falls die Listenelemente nach unten gezogen wurden und die Liste im Status "Bereit zum Aktualisieren" ist, wechselt der
		 * Status der Liste zu "Aktualisiere" und ein entsprechender Event ('refreshing') wird ausgelöst.</p>. 
		 * @param event
		 * @see #onDataGroupPropertyChange()
		 */
		protected function onMouseUp(event:MouseEvent):void{
			if (_readyToRefresh){
				refreshing = true;
				dispatchEvent(new Event('refreshing'));
			}
			else{
				refreshing = false;
			}
		}
		
		//------------------------------------
		// Private functions
		//------------------------------------
		/**
		 * <p>Öffnen eines Callouts mit Titel und Message (z.B. zur vollständige Anzeige eines Labels/Titels, der im ItemRenderer abgeschnitten wurde).
		 * Das Popup verschiebt sich mit dem Listenelement. Das Listenelement ist Parent des Callouts.</p>
		 * <p>Funktioniert nur in Kombination mit <code>com.clx.uicomponents.list.MobileIconItemRenderer</code> als ItemRenderer</p>.
		 * @param event
		 * @see com.clx.uicomponents.list.MobileIconItemRenderer
		 */
		private function openCallout(event:MobileListCalloutEvent):void{
			if (!_preventCalloutOpening){
				closeCallout();
				_callout = new MobileListCallout();
				_callout.title = event.calloutTitle;
				_callout.message = event.calloutMessage;
				
				_callout.maxWidth = this.width - 15;
				_callout.minWidth = this.width - 15;
				_callout.invalidateProperties();
				_callout.id = 'MobileListCallout';
				_callout.verticalPosition = 'after';
				
				_callout.addEventListener(PopUpEvent.OPEN, onCalloutOpen);
				_callout.addEventListener(PopUpEvent.CLOSE, onCalloutClose);
				_callout.open(event.target as DisplayObjectContainer);				
			}
			
		}
		
		/**
		 * <p>Callout-Properties aktualisieren, damit die Position sich mit der Position des zugehörigen ItemRenderers verändert.</p>
		 * @param event
		 */
		private function refreshCalloutProperties(event:Event):void {
			_preventCalloutOpening = true;
			if (_callout && _callout.isOpen){
				_callout.y = _callout.owner.getBounds(this).bottom + getBounds(FlexGlobals.topLevelApplication as DisplayObject).y;
				if (_callout.y  > getBounds(FlexGlobals.topLevelApplication as DisplayObject).bottom ||
					_callout.y  < getBounds(FlexGlobals.topLevelApplication as DisplayObject).top)
					closeCallout();
			}
			callLater(function():void {
				_preventCalloutOpening = false;
			});
		}
		
		/**
		 * <p>Callout wurde geöffnet: Selektion unterdrücken</p>
		 * @param event
		 */
		private function onCalloutOpen(event:PopUpEvent):void{
			preventSelection = true;
		}
		
		/**
		 * <p>Callout wurde geschlossen: Selektion aktivieren</p>
		 * @param event
		 */
		private function onCalloutClose(event:PopUpEvent):void{
			preventSelection = false;
		}
		
		//--------------------------------
		// Private/Protected methods
		//--------------------------------
		/**
		 * Schliessen des Callouts 
		 */
		private function closeCallout():void{
			if (_callout && _callout.isOpen){
				_callout.close();
				preventSelection = false;
			}
		}
		
		//--------------------------------
		// Getter/Setter
		//--------------------------------
		/**
		 * Aktivieren/Deaktivieren der Liste: Alpha wird bei deaktivierter Liste auf 50% gesetzt 
		 * @param value
		 */
		override public function set enabled(value:Boolean):void{
			this.alpha = (value)?1:0.5;
			if (dataProvider){
				ArrayCollection(dataProvider).refresh();
			}
			super.enabled = value;
		}
		/**
		 * Überprüfen, ob die Liste am Aktualisieren ist
		 * @return 
		 */
		public function get refreshing():Boolean{
			return _refreshing;
		}
		/**
		 * <p>Setzen des Status der Liste. Falls <code>true</code> wird die gesamte Liste um die Höhe der Gruppe, welche zur Anzeige des Spinners
		 * benötigt wird, nach unten verschoben.</p>
		 * @param value
		 */
		public function set refreshing(value:Boolean):void{
			if (value == _refreshing)
				return;

			_refreshing = value;
			_pullDownToRefreshGroup.refreshing = value;
			if (_refreshing && _pullDownToRefreshGroup){
				_pullDownToRefreshGroup.height = _pullDownToRefreshGroup.minHeight;
				_pullDownToRefreshGroup.refreshing = true;
				this.y += _pullDownToRefreshGroup.height;
			}
			else if (!_refreshing && _pullDownToRefreshGroup){
				var move:Move = new Move(this);
				move.yFrom = this.y;
				move.yTo = this.y -= _pullDownToRefreshGroup.height;
				move.duration = 200;
				move.play();
				_readyToRefresh = false;
			}
		}
		/**
		 * Setzen des Status 'Bereit zum Aktualisieren'. 
		 * @param value
		 */
		public function set readyToRefresh(value:Boolean):void{
			_readyToRefresh = value;
			if (_pullDownToRefreshGroup){
				_pullDownToRefreshGroup.ready = _readyToRefresh;
			}
		}
		public function set pullDownToRefreshGroup(value:IPullDownToRefreshGroup):void{
			_pullDownToRefreshGroup = value;
		}
		
	}
}