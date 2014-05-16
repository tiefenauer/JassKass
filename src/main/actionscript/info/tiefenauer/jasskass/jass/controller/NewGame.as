/**
 * NewGame.as
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
	import info.tiefenauer.jasskass.jass.event.JassGameEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	public class NewGame extends SimpleCommand
	{
		[Inject] public var event:JassGameEvent;
		[Inject] public var jassProxy:IJassProxy;
		
		override public function execute():void{
			super.execute();
			jassProxy.currentJass.newGame();
		}
	}
}