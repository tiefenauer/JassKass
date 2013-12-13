/**
 * NavigateBackCommand
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller
{
	import flash.events.Event;

	public class NavigateBackCommand extends SimpleCommand
	{
		[Inject] public var event:Event;
		[Inject] public var application:JassKass;
		
		override public function execute():void{
			super.execute();
			application.activeNavigator.popView();
		}
	}
}