package info.tiefenauer.jasskass.app.controller
{
	import avmplus.getQualifiedClassName;
	
	import robotlegs.bender.bundles.mvcs.Command;

	/**
	 * Base class for commands 
	 * @author Daniel Tiefenauer
	 */	
	public class SimpleCommand extends Command{
		
		override public function execute():void{
			super.execute();
			trace(getQualifiedClassName(this));
		}
	}
}