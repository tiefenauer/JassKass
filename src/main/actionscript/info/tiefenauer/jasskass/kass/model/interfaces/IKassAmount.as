/**
 * IKassAmount.as
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
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;

	public interface IKassAmount
	{
		function get id():String;
		function set id(value:String):void;
		
		function get player():IJassPlayer;
		function set player(value:IJassPlayer):void;
		
		function get value():Number;
		function set value(val:Number):void;
	}
}