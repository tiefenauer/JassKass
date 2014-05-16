/**
 * KassAmountFactory.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.model.factory
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	import info.tiefenauer.jasskass.kass.model.KassAmount;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;

	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassAmountFactory
	{
		/**
		 * 
		 * @param obj
		 * @return 
		 */
		public static function fromAzureObject(obj:Object):IKassAmount{
			var kassAmount:KassAmount = new KassAmount();
			for (var key:String in obj) switch(key){
				case 'id':
					kassAmount.id = obj[key];
					break;
				case 'player':
					kassAmount.player = new JassPlayer();
					kassAmount.player.id = obj[key];
					break;
				case 'value':
					kassAmount.value = Number(obj[key]);
					if (isNaN(kassAmount.value))
						kassAmount.value = 0;
					break;
			}
			return kassAmount;
		}
		
		/**
		 * 
		 * @param amount
		 * @return 
		 * 
		 */
		public static function toAzureObject(amount:IKassAmount):Object{
			var obj:Object = new Object();
			if (amount.id)
				obj.id = amount.id;
			if (amount.player)
				obj.player = amount.player.id;
			if (amount.value)
				obj.value = amount.value;
			return obj;
		}
	}
}