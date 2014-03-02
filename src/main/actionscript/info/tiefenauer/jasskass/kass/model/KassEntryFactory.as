package info.tiefenauer.jasskass.kass.model
{
	

	public class KassEntryFactory
	{
		public static function fromXML(node:XML):KassEntry{
			var entry:KassEntry = new KassEntry();
			for each(var attr:XML in node.children()) {
				var attrName:String = attr.localName();
				var attrValue:String = attr.text();
				switch (attrName) {
					case 'datum':
						if (attrName.toLowerCase().indexOf('total') > -1)
							return null;
						var comps:Array = attrValue.split('.');
						entry.date = new Date(comps[2], comps[1], comps[0]);
						break;
					case 'ort':
						if (attrValue.length <= 0)
							return null;
						entry.location = attrValue;
						break;
					case 'kommentar':
						entry.comment = attrValue;
						break;
					case 'totalgejasst':
						entry.total = Number(attrValue.replace(',','.'));
					case 'kontovorher':
						entry.before = Number(attrValue.replace(',','.'));
					case 'kontonachher':
						entry.after = Number(attrValue.replace(',','.'));
				}
			}
			return entry;
		}
	}
}