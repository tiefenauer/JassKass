package info.tiefenauer.jasskass.kass.model.factory
{
	import info.tiefenauer.jasskass.kass.model.KassEntry;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassEntryFactory
	{
		/**
		 * 
		 * @param obj
		 * @return 
		 * 
		 */
		public static function fromAzureObject(obj:Object):IKassEntry{
			var kassEntry:IKassEntry = new KassEntry();
			for (var key:String in obj) switch(key){
				case 'id':
					kassEntry.id = obj[key];
					break;
				case 'date':
					kassEntry.date = new Date();
					kassEntry.date.time = Number(obj[key]);
					break;
				case 'amounts':
					var amounts:Array = obj[key];
					for each(var amountObj:Object in amounts){
						var amount:IKassAmount = KassAmountFactory.fromAzureObject(amountObj);
						kassEntry.amounts.push(amount);
					}
					break;
			}
			return kassEntry;
		}
		
		/**
		 * 
		 * @param entry
		 * @return 
		 */
		public static function toAzureObject(entry:IKassEntry):Object {
			var obj:Object = new Object();
			if (entry.id)
				obj.id = entry.id;
			if (entry.date)
				obj.date = entry.date.time;
			if (entry.amounts){
				var amounts:Array = new Array();
				for each(var amount:IKassAmount in entry.amounts){
					amounts.push(KassAmountFactory.toAzureObject(amount));
				}
				obj.amounts = amounts;
			}
			return obj;
		}
		
	}
}