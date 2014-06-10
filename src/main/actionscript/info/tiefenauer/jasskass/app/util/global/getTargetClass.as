/**
 * custom.as
 *
 * Project: Robotlegs-Sample
 * Date: Apr 4, 2013
 * 
 * @package		info.tiefenauer.rlsample.core.app.util
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
	
	import info.tiefenauer.jasskass.app.util.global.pattern.corePackagePattern;
	import info.tiefenauer.jasskass.app.util.global.pattern.customPackagePattern;

	/**
	 * <p>Hilfsfunktion zum Ermitteln der korrekten Klasse (core- oder custom-Version) für eine andere Klasse</p>
	 * <p>Falls eine Klasse mit identischem Namen an der exakt gleichen Position im <em>Custom</em>-Package existiert, wird diese zurückgegeben. 
	 * Falls umgekehrt bereits eine Klasse im <em>Custom</em>-Package übergeben wurde und der <code>bidirectional</code>-Parameter auf <code>true</code>
	 * gesetzt wurde, wird versucht, dieselbe Klasse im <em>Core</em>-Package zu finden. Falls nichts gefunden wird, wird die Klasse aus dem Input 
	 * zurückgegeben</p>
	 * @param sourceClass zu übersetzende Klasse
	 * @param bidirectional definiert, ob die Übersetzung auch von einer <em>Custom</em>-Klasse zu einer <em>Core</em>-Klasse erfolgen soll.
	 */
	public function getTargetClass(sourceClass:Class, bidirectional:Boolean = false):*{
		var targetClass:Class;
		var sourceclassName:String = getQualifiedClassName(sourceClass);
		var targetclassName:String = '';
		
		switch(true){
			// core class => custom class
			case corePackagePattern.test(sourceclassName):
				targetclassName = sourceclassName.split(corePackagePattern).join('.custom.');
				break;
			// custom class => core class
			case customPackagePattern.test(sourceclassName) && bidirectional:
				targetclassName = sourceclassName.split(customPackagePattern).join('.core.');
				break;
			// use source class as target class
			default:
				targetclassName = sourceclassName;
				break;
		}
		
		// try conversion
		try{
			targetClass = getDefinitionByName(targetclassName) as Class;
		}
		// conversion failed => use source class
		catch(error:ReferenceError){
			targetClass = sourceClass;
		}
		return targetClass;
	}
}