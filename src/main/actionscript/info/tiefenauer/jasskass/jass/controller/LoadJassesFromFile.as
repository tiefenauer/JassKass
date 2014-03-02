package info.tiefenauer.jasskass.jass.controller
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.factory.JassFactory;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * Load Jasses from File 
	 * @author Daniel
	 */
	public class LoadJassesFromFile extends SimpleCommand
	{
		[Inject] public var event:JassProxyEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			var file:File = File.applicationStorageDirectory.resolvePath('jasses.json');
			if (file.exists){
				var fs:FileStream = new FileStream();
				fs.open(file, FileMode.READ);
				var fileContent:String = fs.readUTFBytes(fs.bytesAvailable);
				fs.close();
				
				var jassesObj:Object = JSON.parse(fileContent);
				for each(var jassObj:Object in jassesObj){
					var jass:IJass = JassFactory.fromObject(jassObj);
					jassProxy.jassList.push(jass);
				}
			}
				
		}
	}
}