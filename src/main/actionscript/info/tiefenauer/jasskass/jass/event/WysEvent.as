/**
 * WysEvent
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.event
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.enum.WysType;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassTeam;
	import info.tiefenauer.jasskass.jass.model.interfaces.IWys;
	import info.tiefenauer.jasskass.jass.model.vo.Wys;
	
	/**
	 * Event class for Wys 
	 * @author Daniel Tiefenauer
	 */
	public class WysEvent extends Event
	{
		public static const NAME:String = 'WysEvent';
		// event types
		public static const WYS:String = NAME + 'Wys';
		public static const STOECK:String = NAME + 'Stoeck';
		
		public static const WYS_ADDED:String = NAME + 'WysAdded';
		
		public var team:IJassTeam;
		public var wyses:Vector.<IWys>;
		public var factor:Number;
		
		public function WysEvent(type:String, team:IJassTeam, wyses:Vector.<IWys>=null, factor:Number=1, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			this.team = team;
			this.factor = factor;
			if (wyses)
				this.wyses = wyses;
			else
				this.wyses = new Vector.<IWys>();
			if (type == STOECK)
				this.wyses.push(new Wys(WysType.STOECK));
		}
	}
}