/**
 * formFactor.as
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
	import flash.utils.getQualifiedClassName;
	
	import info.tiefenauer.jasskass.app.util.global.pattern.phoneViewPattern;
	import info.tiefenauer.jasskass.app.util.global.pattern.tabletViewPattern;
	
	/**
	 * <p>Hilfsfunktion zum ermitteln der korrekten View-Klasse zur optimalen Darstellung auf dem Gerät zur Laufzeit.</p>
	 * <p>Diese globale Funktion nimmt eine Klasse als Inputargument und sucht nach einer Zielklasse mit exakt dem selben Klassennamen an der exakt
	 * gleichen Position im entsprechenden <em>phone</em>- oder <em>tablet</em>-Package. Die Suche erfolgt abhängig vom Formaktor des Gerätes, auf dem
	 * die App läuft. Falls eine Klasse gefunden wird, wird diese zurückgegeben. </p>
	 * <p>Die Unterscheidung von Phone- oder Tablet-Views erfolgt anhand des vollständigen Klassennamens. Bei der Suche wird wie folgt vorgegangen:</p>
	 * <ul>
	 * 		<li>Falls die App auf einem Tablet läuft und eine Tablet-View übergeben wird, wird die Klasse unverändert zurückgegeben</li>
	 * 		<li>Falls die App auf einem Phone läuft und eine Phone-View übergeben wird,wird die Klasse unverändert zurückgegeben</li>
	 * 		<li>Falls die App auf einem Tablet läuft und eine Phone-View übergeben wird, wird versucht, eine Tablet-View zu finden</li>
	 * 		<li>Falls die App auf einem Phone läuft und eine Tablet-View übergeben wird, wird versucht, eine Tablet-View zu finden</li>
	 * </ul>
	 * @param sourceClass <code>Class</code>-Objekt, welches von <code>spark.components.View</code> abgeleitet ist
	 * @see com.clx.satellite.core.util.global.pattern.#phoneViewPattern
	 * @see com.clx.satellite.core.util.global.pattern.#tabletViewPattern
	 */
	public function getViewFormFactor(sourceClass:Class):Class{
		var targetClass:Class;
		var sourceClassName:String = getQualifiedClassName(sourceClass);
		var targetClassName:String = '';
		
		// replace name to match form factor
		switch (true){
			// trying to push phone view on tablet
			case phoneViewPattern.test(sourceClassName) && Device.IS_TABLET:
				targetClassName = sourceClassName.replace(phoneViewPattern, tabletViewPattern.source);
				break;
			// trying to push tablet view on phone
			case tabletViewPattern.test(sourceClassName) && Device.IS_PHONE:
				targetClassName = sourceClassName.replace(tabletViewPattern, phoneViewPattern.source);
				break;
			// trying to push phone view on phone or tablet view on tablet (this is OK)
			default:
				targetClassName = sourceClassName;
				break;
		}
		
		// get class for form factor
		targetClass = getTargetClassFromString(targetClassName);
		if (targetClass)
			return targetClass;
		return sourceClass;
	}
}