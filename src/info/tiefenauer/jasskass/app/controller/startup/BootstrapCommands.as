package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommandMapping;
	
	public class BootstrapCommands extends SimpleCommand
	{
		[Inject] public var commandMap:ICommandMapping;
		
		override public function execute():void{
			super.execute();
		}
	}
}