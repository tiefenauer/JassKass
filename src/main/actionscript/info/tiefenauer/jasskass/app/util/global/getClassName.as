/**
 * getClassName.as
 *
 * Project: CLX.Satellite.RL
 * Date: Apr 22, 2013
 * 
 * @package		assets.global
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		Daniel Tiefenauer (daniel.tiefenauer[at]crealogix.com)
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.app.util.global
{
	import flash.utils.getQualifiedClassName;

	/**
	 * <p>Hilfsfunktion, welche für ein beliebiges Objekt den Klassennamen ermittelt. Der Klasssenname wird so formatiert, dass er auch in JSONS oder XMLs
	 * gespeichert werden kann</p>
	 * @param obj ein beliebiges Objet
	 * @return mit Dot-Syntax formatierter Klassenname 
	 */
	public function getClassName(obj:*):String {
		return getQualifiedClassName(obj).split('::').join('.');
	}
}