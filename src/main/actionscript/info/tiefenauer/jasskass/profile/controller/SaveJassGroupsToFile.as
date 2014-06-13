package info.tiefenauer.jasskass.profile.controller
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * Registrierte Jassgruppen speichern
	 * @author Daniel
	 */
	public class SaveJassGroupsToFile extends SimpleCommand
	{
		[Inject] public var event:JassGroupProxyEvent;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function execute():void{
			super.execute();
			var jassGroupArr:Array = new Array();
			for each(var jassGroup:IJassGroup in jassGroupProxy.jassGroups){
				jassGroupArr.push(JassGroupFactory.toAzureObject(jassGroup));
			}
			var file:File = File.applicationStorageDirectory.resolvePath('jassGroups.json');
			if (file.exists)
				file.deleteFile();
			
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.WRITE);
			fs.writeUTFBytes(JSON.stringify(jassGroupArr));
			fs.close();
		}
	}
}