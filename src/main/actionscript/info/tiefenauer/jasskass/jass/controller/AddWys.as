/**
 * AddWys
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.enum.WysType;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	
	/**
	 * Add wys to current game 
	 * @author Daniel Tiefenauer
	 */
	public class AddWys extends SimpleCommand
	{
		[Inject] public var event:WysEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			for each(var wys:IWys in event.wyses){
				checkPenalty(wys);
				wys.value = event.factor * wys.value;
			}
			jassProxy.addWysToCurrentGame(event.team, event.wyses)
		}
		
		private function checkPenalty(wys:IWys):void{
			switch(wys.type){
				case WysType.VIER_BAUERN:
					if (event.team == jassProxy.currentJass.team1)
						jassProxy.addPenaltyToCurrentJass(jassProxy.currentJass.team2, 1);
					else
						jassProxy.addPenaltyToCurrentJass(jassProxy.currentJass.team1, 1);
					break;
			}
		}
	}
}