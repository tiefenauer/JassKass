/**
 * getClassOf.as
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
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * <p>Hilfsfunktion zum ermitteln der Klasse eines beliebigen Objektes</p>
	 * <p>Imm Gegensatz zur globalen Methode <code>com.clx.satellite.core.util.global.getClassName</code> ist der Rückgabewert vom Typ <code>Class</code>.</p> 
	 * @param obj beliebiges Objekt
	 * @return Klasse des Objektes als <code>Class</code>
	 * @see com.clx.satellite.core.util.global#getClassName
	 */
	public function getClassOf(obj:Object):Class{
		return Class(getDefinitionByName(getQualifiedClassName(obj)));
	}
}