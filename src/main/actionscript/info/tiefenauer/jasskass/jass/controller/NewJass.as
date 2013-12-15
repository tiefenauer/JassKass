/**
 * CreateJass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.vo.Jass;
	import info.tiefenauer.jasskass.jass.views.phone.TeamBuilderView;
	
	/**
	 * Create a new Jass 
	 * @author Daniel Tiefenauer
	 */
	public class NewJass extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var app:JassKass;
		
		override public function execute():void{
			super.execute();
			app.activeNavigator.pushView(TeamBuilderView, new Jass());
		}
	}
}