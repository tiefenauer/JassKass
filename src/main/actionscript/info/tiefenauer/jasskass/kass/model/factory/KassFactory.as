/**
 * KassFactory.as
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
	import info.tiefenauer.jasskass.kass.model.Kass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.profile.model.JassGroup;

	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassFactory
	{
		/**
		 * 
		 * @param obj
		 * @return 
		 * 
		 */
		public static function fromAzureObject(obj:Object):IKass{
			var kass:IKass = new Kass();
			for(var key:String in obj) switch(key){
				case 'id':
					var id:String = obj[key];
					if (id && id.length > 0)
						kass.id = id;
					break;
				case 'groupid':
					kass.group = new JassGroup();
					kass.group.id = obj[key];
					break;
				case 'entries':
					var entries:Array = obj[key];
					for each(var entryObj:Object in entries){
						var entry:IKassEntry = KassEntryFactory.fromAzureObject(entryObj);
						kass.addEntry(entry);
					}
					break;
			}
			return kass;
		}
		
		/**
		 * 
		 * @param kass
		 * @return 
		 * 
		 */
		public static function toAzureObject(kass:IKass):Object{
			var obj:Object = new Object();
			if (kass.id && kass.id.length > 0)
				obj.id = kass.id;
			if (kass.group)
				obj.groupid = kass.group.id;
			var entries:Array = [];
			for each(var entry:IKassEntry in kass.entries){
				entries.push(KassEntryFactory.toAzureObject(entry));
			}
			obj.entries = entries;
			return obj;
		}
	}
}