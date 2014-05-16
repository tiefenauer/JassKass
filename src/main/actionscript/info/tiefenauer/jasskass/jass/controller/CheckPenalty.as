/**
 * CheckPenalty.as
 *
 * Project: JassKass
 * Date: May 14, 2014
 * 
 * @package		info.tiefenauer.jasskass.jass.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.model.enum.JassPoints;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	public class CheckPenalty extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			switch(true){
				case jassProxy.currentJass.currentGame.team1TotalPoints >= JassPoints.SIEG:
					dispatch(new PenaltyEvent(PenaltyEvent.SIEG, jassProxy.currentJass.team2));
					break;
				case jassProxy.currentJass.currentGame.team2TotalPoints >= JassPoints.SIEG:
					dispatch(new PenaltyEvent(PenaltyEvent.SIEG, jassProxy.currentJass.team1));
				case jassProxy.currentJass.currentGame.team1TotalPoints >= JassPoints.BERGPREIS:
					dispatch(new PenaltyEvent(PenaltyEvent.BERGPREIS, jassProxy.currentJass.team2));
					break;
				case jassProxy.currentJass.currentGame.team2TotalPoints >= JassPoints.BERGPREIS:
					dispatch(new PenaltyEvent(PenaltyEvent.BERGPREIS, jassProxy.currentJass.team1));
					break;
			}
		}
		
	}
}