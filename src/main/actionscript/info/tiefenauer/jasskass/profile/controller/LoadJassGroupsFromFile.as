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
	
	public class LoadJassGroupsFromFile extends SimpleCommand
	{
		[Inject] public var event:JassGroupProxyEvent;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function execute():void{
			super.execute();
			var file:File = File.applicationStorageDirectory.resolvePath('jassGroups.json');
			if (file.exists){
				var fs:FileStream = new FileStream();
				fs.open(file, FileMode.READ);
				var fileContent:String = fs.readUTFBytes(fs.bytesAvailable);
				fs.close();
				
				var jassGroupsObj:Object = JSON.parse(fileContent);
				for each(var jassGroupObj:Object in jassGroupsObj){
					var jassGroup:IJassGroup = JassGroupFactory.fromAzureObject(jassGroupObj);
					jassGroupProxy.addJassGroup(jassGroup);
				}
			}
			
		}
	}
}