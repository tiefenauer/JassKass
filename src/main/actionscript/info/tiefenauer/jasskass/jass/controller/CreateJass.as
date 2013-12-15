/**
 * CreatJass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	public class CreateJass extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var application:JassKass;
		
		override public function execute():void{
			super.execute();
			jassProxy.addJass(event.jass);
			application.activeNavigator.popView();
		}
	}
}