/**
 * ISimplePopup.as
 *
 * Project: clx-satellite
 * Date: Nov 7, 2013
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
	/**
	 * <p>Interface für Popups</p>
	 * <p>Ein Popup muss immer zumindest die Folgenden Funktionalitäten anbieten:</p>
	 * <ul>
	 * 		<li>Setzen eines Titels</li>
	 * 		<li>Setzen einer Message</li>
	 * 		<li>öffnen</li>
	 * 		<li>schliessen</li>
	 * </ul> 
	 * @author dtie
	 */
	public interface ISimplePopup
	{
		function get title():String;
		function set title(value:String):void;
		
		function get message():String;
		function set message(value:String):void;
		
		function show():void;
		function close(commit:Boolean=false, data:*=null):void;
	}
}