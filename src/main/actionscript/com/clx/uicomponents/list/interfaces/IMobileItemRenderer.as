/**
 * IMobileItemRenderer.as
 *
 * Project: CLX.Satellite Core
 * Date: Feb 14, 2013
 * 
 * @package		ch.crealogix.satellite.app.view.elements.interfaces
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		Daniel Tiefenauer (daniel.tiefenauer[at]crealogix.com)
 * @version		1.0.0
 *
 */

package com.clx.uicomponents.list.interfaces
{
	

	/**
	 * <p>Interface für alle MobileItemRenderer</p>
	 * <p>MobileItemRenderer müssen mindestens folgende Funktionalität ausweisen:</p>
	 * <ul>
	 * 		<li>Ermitteln des Textes, der für das Label angezeigt wird</li>
	 * 		<li>Ermitteln des Textes, der für die Message angezeigt wird</li>
	 * </ul>
	 * @author dtie
	 */
	public interface IMobileItemRenderer
	{
		function get labelText():String;
		function get messageText():String;
		//function get preventSelection():Boolean;
	}
}