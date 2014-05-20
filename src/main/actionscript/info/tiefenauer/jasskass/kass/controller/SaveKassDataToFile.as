/**
 * SaveKassData.as
 *
 * Project: JassKass
 * Date: May 20, 2014
 * 
 * @package		info.tiefenauer.jasskass.kass.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.kass.controller
{
	import flash.filesystem.File;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.model.interfaces.ITextFileService;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.factory.KassFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class SaveKassDataToFile extends SimpleCommand
	{
		[Inject] public var event:KassEvent;
		[Inject] public var kassProxy:IKassProxy;
		[Inject] public var fileService:ITextFileService;
		
		/**
		 * 
		 * 
		 */
		override public function execute():void{
			super.execute();
			dispatch(new KassEvent(KassEvent.SAVE_KASS_DATA_START));
			
			var kasses:Array = [];
			kassProxy.kasses.forEach(function(kass:IKass):void{
				kasses.push(KassFactory.toAzureObject(kass));
			});
			fileService.file = File.applicationStorageDirectory.resolvePath('kassData');
			fileService.write(JSON.stringify(kasses));
			
			dispatch(new KassEvent(KassEvent.SAVE_KASS_DATA_END));
		}
	}
}
