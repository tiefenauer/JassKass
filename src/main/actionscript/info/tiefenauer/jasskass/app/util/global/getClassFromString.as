/**
 * getClassFromString.as
 *
 * Project: IGH DataSelect
 * Date: May 16, 2013
 * 
 * @package		ch.igh.dataselect.mobile.util.global
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.app.util.global
{
	import flash.utils.getDefinitionByName;

	/**
	 * <p>Hilfsfunktion, welche versucht, eine Klasse anhand des Klassennamens zu ermitteln</p>
	 * @param str Klassenname als String
	 * @return Klasse, falls eine ermittelt werden konnte, andernfall <em>null</em> 
	 */
	public function getClassFromString(str:String):Class{
		var cla:Class;
		try {
			cla = getDefinitionByName(str) as Class
		}
		catch (error:ReferenceError){
			cla = null;
		}
		return cla;
	}
}