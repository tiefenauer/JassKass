/**
 * AddStrich
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * Add Strich 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class AddPenalty extends SimpleCommand
	{
		[Inject] public var event:PenaltyEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			switch(event.type){
				case PenaltyEvent.BERGPREIS:
					bergpreis();
					break;
				case PenaltyEvent.MATCH:
					match();
					break;
				case PenaltyEvent.KONTERMATCH:
					kontermatch();
					break;
				case PenaltyEvent.SIEG:
					sieg();
					break;
				case PenaltyEvent.VIER_BAUERN:
					vierBauern();
					break;
			}
		}
		
		private function bergpreis():void{
			jassProxy.addPenaltyToCurrentJass(event.team, 1);
		}
		
		private function match():void{
			jassProxy.addPenaltyToCurrentJass(event.team, 1);
		}
		private function kontermatch():void{
			jassProxy.addPenaltyToCurrentJass(event.team, 1);
		}
		private function sieg():void{
			jassProxy.addPenaltyToCurrentJass(event.team, 2);
		}
		private function vierBauern():void{
			jassProxy.addPenaltyToCurrentJass(event.team, 2);
		}
	}
}