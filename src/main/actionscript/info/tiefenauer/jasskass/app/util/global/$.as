/**
 * $.as
 *
 * Project: Robotlegs-Sample
 * Date: Apr 4, 2013
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
	import flash.utils.describeType;

	/**
	 * <p>Hilfsfunktion zum Ermitteln der korrekten Klasse (core- oder custom-Version) für einen String oder eine Klasse</p>
	 * <p>Diese globale Methode nimmt eine Klasse als String oder Klassendefinition und ermittelt ausgehend vom vollständigen Klassennamen 
	 * eine Zielklasse. Dabei wird wie folgt vorgegangen:</p>
	 * <ul>
	 * 		<li>Falls die Klassendefinition als String übergeben wird, wird zuerst versucht, aus dem String ein <code>Class</code>-Objekt zu erzeugen.
	 * 			Falls die Klassendefinition bereits als <code>Class</code>-Objekt übergeben wurde, wird die Klasse so weiterverarbeitet.</li>
	 * 		<li>Falls eine Klasse mit identischem Namen an der exakt gleichen Position im <em>Custom</em>-Package existiert, wird diese zurückgegeben.
	 * 			Falls umgekehrt bereits eine Klasse im <em>Custom</em>-Package übergeben wurde und der <code>bidirectional</code>-Parameter auf <code>true</code>
	 * 			gesetzt wurde, wird versucht, dieselbe Klasse im <em>Core</em>-Package zu finden</li>
	 * 		<li>Falls eine entsprechende Klasse im <em>Custom</em>- bzw. <em>Core</em>-Package gefunden wurde, wird diese zurückgegeben</li>
	 * 		<li>Falls eine Klasse übergeben wurde, welche von <code>spark.components.View</code> abgeleitet ist, wird zusätzlich versucht, die View
	 * 			in eine <em>Phone-</em> bzw. <em>Tablet-</em>Version zu finden (s. getViewFormFactor)</li>
	 * </ul>
	 * @param classDefinitionOrName Klassendefinition als <code>Class</code>-Objekt oder String
	 * @param bidirectional definiert, ob die Übersetzung auch von einer <em>Custom</em>-Klasse zu einer <em>Core</em>-Klasse erfolgen soll.
	 * @see com.clx.satellite.core.util.global.#getTargetClass()
	 * @see com.clx.satellite.core.util.global.#getViewFormFactor()
	 */
	public function $(classDefinitionOrName:*, bidirectional:Boolean = false):*{
		// translate Class object 
		if (classDefinitionOrName is Class)
			// convert to class in custom/core package
			var targetClass:Class = getTargetClass(classDefinitionOrName, bidirectional);
		
			// check if Class extends spark.components.View
			var typeXML:XML = describeType(targetClass);
			if (typeXML.factory.extendsClass.(@type=='spark.components::View').length() > 0)
				return getViewFormFactor(targetClass);
			
			// class does not extend spark.components.View
			return targetClass;
			
		// convert String to Class
		if (classDefinitionOrName is String)
			return getTargetClassFromString(classDefinitionOrName as String, bidirectional);
		
		// no other types supported!
		return null;
	}
}