package info.tiefenauer.jasskass.kass.controller
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.KassEntryFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	/**
	 * JassKass-Daten von Drive herunterladen 
	 * @author Daniel
	 */
	public class DownloadKassData extends SimpleCommand
	{
		[Inject] public var event:KassEvent;
		
		private var urlLoader:URLLoader = new URLLoader();length
		override public function execute():void{
			super.execute();
			
			
			var request:URLRequest = new URLRequest("https://spreadsheets.google.com/feeds/list/0Ar0F2oedrRXMdEMxTGpSZEp6VjdIX25DcW5kbEFVMXc/od6/private/full");
			request.method = URLRequestMethod.GET;
			urlLoader.addEventListener(Event.COMPLETE, onRequestComplete);
			urlLoader.load(request);
		}
		
		private function onRequestComplete(event:Event):void{
			trace('data received:');
			var responseXML:XML = XML(urlLoader.data);
			var children:XMLList = responseXML.children();
			
			var entries:Vector.<IKassEntry> = new Vector.<IKassEntry>();
			for each(var node:XML in responseXML.children()){
				if (node.localName() == 'entry'){
					var entry:IKassEntry = KassEntryFactory.fromXML(node);
					if(entry)
						entries.push(entry);
				}
			}
			
			dispatch(new KassEvent(KassEvent.DOWNLOAD_KASS_DATA_END, entries));
		}
			
	}
}