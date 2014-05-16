/**
 * IKass.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.model.interfaces
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.model.interfaces
{
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;

	public interface IKass
	{
		function addEntry(value:IKassEntry):void;
	
		function get id():String;
		function set id(value:String):void;
		
		function get group():IJassGroup;
		function set group(value:IJassGroup):void;
		
		function get entries():Vector.<IKassEntry>;
	}
}