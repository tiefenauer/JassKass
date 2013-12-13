/**
 * ShowJassDetails
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.views.phone.JassDetailView;
	
	/**
	 * Show Details of finished Jass on new screen 
	 * @author Daniel
	 */
	public class ShowJassDetails extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var app:JassKass;
		
		override public function execute():void{
			super.execute();
			app.activeNavigator.pushView(JassDetailView, event.jass);
		}
	}
}