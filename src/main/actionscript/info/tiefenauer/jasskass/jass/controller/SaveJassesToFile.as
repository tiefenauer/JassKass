package info.tiefenauer.jasskass.jass.controller
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class SaveJassesToFile extends SimpleCommand
	{
		[Inject] public var event:JassProxyEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			var jsonContent:String = '';
			for each(var jass:IJass in jassProxy.jassList){
				jsonContent += JSON.stringify(jass.toObject());
			}
			var file:File = File.applicationStorageDirectory.resolvePath('jasses.json');
			if (file.exists)
				file.deleteFile();
			
			var fs:FileStream = new FileStream();
			fs.open(file, FileMode.WRITE);
			fs.writeUTFBytes(jsonContent);
			fs.close();
		}
	}
}