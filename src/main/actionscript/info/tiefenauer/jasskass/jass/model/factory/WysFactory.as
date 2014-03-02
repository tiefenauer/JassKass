package info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	import info.tiefenauer.jasskass.jass.model.vo.Wys;

	public class WysFactory
	{
		/**
		 * 
		 * @return 
		 * 
		 */
		public static function toObject(wys:IWys):Object{
			var obj:Object = new Object();
			obj['type'] = wys.type;
			obj['value'] = wys.value;
			return obj;
		}
		
		/**
		 * 
		 * @param obj
		 * 
		 */
		public static function fromObject(obj:Object):IWys{
			var wys:Wys = new Wys();
			for(var key:String in obj){
				switch(key){
					case 'type':
						wys.type = obj[key];
						break;
					case 'value':
						wys.value = Number(obj[key]);
						break;
				}
			}
			return wys;
		}
	}
}