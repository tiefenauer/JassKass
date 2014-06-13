/**
 * MatchSignal.as
 *
 * Project: JassKass
 * Date: Jun 13, 2014
 * 
 * @package		info.tiefenauer.jasskass.jass.signals
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.jass.signals
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	
	import org.osflash.signals.Signal;
	
	/**
	 * 
	 * @author dtie
	 */
	public class MatchSignal extends Signal
	{
		public function MatchSignal(){
			super(IJassTeam);
		}
	}
}