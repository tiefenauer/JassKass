/**
 * AddStrich
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.ScoreEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * Add Strich 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class AddScore extends SimpleCommand
	{
		[Inject] public var event:ScoreEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			switch(event.type){
				case ScoreEvent.BERGPREIS:
					bergpreis();
					break;
				case ScoreEvent.MATCH:
					match();
					break;
				case ScoreEvent.KONTERMATCH:
					kontermatch();
					break;
				case ScoreEvent.SIEG:
					sieg();
					break;
				case ScoreEvent.VIER_BAUERN:
					vierBauern();
					break;
			}
		}
		
		private function bergpreis():void{
			jassProxy.addStrichToCurrentJass(event.team, 1);
		}
		
		private function match():void{
			jassProxy.addStrichToCurrentJass(event.team, 1);
		}
		private function kontermatch():void{
			jassProxy.addStrichToCurrentJass(event.team, 1);
		}
		private function sieg():void{
			jassProxy.addStrichToCurrentJass(event.team, 2);
		}
		private function vierBauern():void{
			jassProxy.addStrichToCurrentJass(event.team, 2);
		}
	}
}