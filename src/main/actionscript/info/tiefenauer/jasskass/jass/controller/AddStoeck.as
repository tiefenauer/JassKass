/**
 * AddStoeck
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	public class AddStoeck extends SimpleCommand
	{
		[Inject] public var event:WysEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			jassProxy.currentJass.currentGame.addWyses(event.team, event.wyses);
		}
	}
}