/**
 * RefreshGroup.as
 *
 * Project: CLX.UIComponents
 * Date: Dec 6, 2013
 * 
 * @package		com.clx.uicomponents.list.component
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package com.clx.uicomponents.list.component
{
	import com.clx.uicomponents.list.interfaces.IPullDownToRefreshGroup;
	import com.clx.uicomponents.skins.DefaultPullDownToRefreshGroupSkin;
	
	import spark.components.SkinnableContainer;
	import spark.core.IDisplayText;

	[SkinState("waitingForRefresh")]
	[SkinState("waitingForRelease")]
	[SkinState("refreshing")]
	
	/**
	 * <p>Basisklasse für eine Gruppe, welche in einer <code>com.clx.uicomponents.list.MObileLsit</code> bei aktiviertem "Pull Down To Refresh"
	 * zur Anzeige eines Spinners genutzt werden kann</p> 
	 * @author dtie
	 * @see com.clx.uicomponents.list.MobileList
	 */
	public class PullDownToRefreshGroup extends SkinnableContainer implements IPullDownToRefreshGroup
	{
		/**
		 * Label zur Anzeige eines Textes, welcher Auskunft über den Status ('readyToRefresh', 'refreshing', ...) der Liste gibt  
		 */
		[SkinPart(required="true")] public var refreshLabel:IDisplayText;
		
		public var _ready:Boolean;
		
		/**
		 * Constructor 
		 */
		public function PullDownToRefreshGroup(){
			setStyle('skinClass', DefaultPullDownToRefreshGroupSkin);
			minHeight = 100;
		}
		
		public function set ready(value:Boolean):void{
			_ready = value;
			if (_ready)
				skin.setCurrentState('waitingForRelease');
			else 
				skin.setCurrentState('waitingForRefresh');
		}
		public function get ready():Boolean{
			return _ready;
		}
		
		public function set refreshing(value:Boolean):void{
			if (value)
				skin.setCurrentState('refreshing');
			else
				skin.setCurrentState('waitingForRefresh');
		}
		
		public function set labelText(value:String):void{
			refreshLabel.text = value;
		}
	}
}