/**
 * AzureKassService.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		info.tiefenauer.jasskass.azure.service
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.kass.model.factory.KassFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;

	public class KassService extends AzureService
	{
		
		/**
		 * 
		 * @param endpoint
		 */
		public function KassService(){
			super('getkass');
			_completeHandler = onKassDownloaded;
			onSuccess = new Signal(IKass);
		}
		
		/**
		 * 
		 * @param group
		 * 
		 */
		public function getKass(group:IJassGroup):void{
			_endpoint = 'getkass';
			if (group.id && group.id.length > 0){
				byId(group.id);
			}
			else if (group.key && group.key.length > 0){
				byKey(group.key);
			}
			else{
				throw(new Error('Key und/oder ID müssen angegeben werden!'));
			}
		}
		
		/**
		 * 
		 * @param group
		 * @param entries
		 */
		public function addEntries(kass:IKass, entries:Array):void{
			_body = JSON.stringify({
				kass: {
					groupid: kass.group.id,
					entries: entries
				}
			});
			POST();
		}
		
		private function byId(id:String):void{
			_endpoint += 'byId?';
			_endpoint += 'groupId=' + id;			
			GET();
		}
		private function byKey(key:String):void{
			_endpoint += 'byKey?';
			_endpoint += 'groupKey=' + key;
			GET();
		}
		
		private function onKassDownloaded(event:Event):void{
			try{
				var kassObj:Object = JSON.parse(urlLoader.data);
				var kass:IKass = KassFactory.fromAzureObject(kassObj);
				onSuccess.dispatch(kass);
			}
			catch(error:Error) {
				onError.dispatch(error);
			}
		}
	}
}