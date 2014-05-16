/**
 * KassProxy.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.model
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.model
{
	import info.tiefenauer.jasskass.app.model.Actor;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	
	public class KassProxy extends Actor implements IKassProxy
	{
		private var _kasses:Vector.<IKass> = new Vector.<IKass>();
		
		public function get kasses():Vector.<IKass>{
			return _kasses;
		}
	}
}