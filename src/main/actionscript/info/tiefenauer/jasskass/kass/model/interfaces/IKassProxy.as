/**
 * IJassProxy.as
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
	/**
	 * 
	 * @author dtie
	 */
	public interface IKassProxy
	{
		/**
		 * Get Current Kass 
		 * @return 
		 */
		function get currentKass():IKass;
		
		/**
		 * Get all Kasses
		 * @return 
		 */
		function get kasses():Vector.<IKass>;
		
		/**
		 * Add Entries to Kass 
		 * @param entries
		 * @param kass
		 * @return 
		 */
		function addKass(kass:IKass):void;
		
	}
}