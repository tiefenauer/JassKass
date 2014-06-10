/**
 * getClassFromString.as
 *
 * Project: Robotlegs-Sample
 * Date: Apr 4, 2013
 * 
 * @package		assets.functions
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		Daniel Tiefenauer (daniel.tiefenauer[at]crealogix.com)
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.app.util.global
{
	import flash.utils.getDefinitionByName;
	
	import info.tiefenauer.jasskass.app.util.global.pattern.corePackagePattern;
	import info.tiefenauer.jasskass.app.util.global.pattern.customPackagePattern;

	/**
	 * <p>Hilfsfunktion zum Ermitteln der korrekten Klasse (core- oder custom-Version) für einen String</p>
	 * <p>Zuerst wird versucht, aus dem String eine Klassendefinition herzuleiten. Falls dies misslingt, wird <em>undefined</em> zurücktgegeben</p>
	 * <p>Falls dies gelingt und eine Klasse mit identischem Namen an der exakt gleichen Position im <em>Custom</em>-Package existiert, wird diese zurückgegeben. 
	 * Falls umgekehrt bereits eine Klasse im <em>Custom</em>-Package übergeben wurde und der <code>bidirectional</code>-Parameter auf <code>true</code>
	 * gesetzt wurde, wird versucht, dieselbe Klasse im <em>Core</em>-Package zu finden. Falls nichts gefunden wird, wird die Klasse aus dem Input 
	 * zurückgegeben</p>
	 * <p>Es ist auch möglich, eine Klassendefinition für eine Klasse, die gar nicht existiert, mitzugeben. Falls eine Klasse mit diesem Namen im <em>Core</em>
	 * resp. <em>Custom</em>-Package existiert, kann trotzdem eine Klasse zurückgegeben werden.</p>
	 * @param sourceClassName Klassendefinition als String
	 * @param bidirectional definiert, ob die Übersetzung auch von einer <em>Custom</em>-Klasse zu einer <em>Core</em>-Klasse erfolgen soll.
	 */
	public function getTargetClassFromString(sourceClassName:String, bidirectional:Boolean = false):Class{
		var targetClass:Class;
		
		try {
			targetClass = getDefinitionByName(sourceClassName) as Class;
		}
		catch (error:ReferenceError){
			switch (true){
				case corePackagePattern.test(sourceClassName):
					sourceClassName = sourceClassName.replace(corePackagePattern, '.custom.');
					targetClass = getTargetClassFromString(sourceClassName);
					break;
				case customPackagePattern.test(sourceClassName) && bidirectional:
					sourceClassName = sourceClassName.replace(customPackagePattern, '.core.');
					targetClass = getTargetClassFromString(sourceClassName);
					break;
				default:
					targetClass = null;
					break;
			}
		}
		return targetClass;
	}
}