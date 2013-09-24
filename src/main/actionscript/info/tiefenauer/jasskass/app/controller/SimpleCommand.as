package info.tiefenauer.jasskass.app.controller
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import avmplus.getQualifiedClassName;
	
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.framework.api.IContext;

	/**
	 * Base class for commands 
	 * @author Daniel Tiefenauer
	 */	
	public class SimpleCommand extends Command{
		
		[Inject] public var context:IContext;
		[Inject] public var eventDispatcher:IEventDispatcher;
		
		override public function execute():void{
			super.execute();
			trace(getQualifiedClassName(this));
		}
		
		protected function dispatch(event:Event):void{
			eventDispatcher.dispatchEvent(event);
		}
		
		protected function detain():void{
			context.detain(this);
		}
		protected function release():void{
			context.release(this);
		}
	}
}