/**
 * JassGamePenaltyView
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.base
{
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	/**
	 * Base class for JassGame Penalties 
	 * @author Daniel Tiefenauer
	 */
	public class JassPenaltyViewBase extends MobileView
	{
		public static const NAME:String = 'JassScoreViewBase';
		// event types
		public static const FLIP:String = NAME + 'Flip';
		
		[Bindable]
		public function get jass():IJass{
			if (data is IJass)
				return data as IJass;
			return null;
		}
		public function set jass(value:IJass):void{
			data = value;
		}
			
	}
}