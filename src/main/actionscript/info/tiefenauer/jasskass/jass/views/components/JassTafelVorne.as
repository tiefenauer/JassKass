/**
 * JassTafelVorne
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.components
{
	import spark.components.supportClasses.SkinnableComponent;
	import spark.core.IDisplayText;
	
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	
	[SkinState("normal")]
	[SkinState("disabled")]
	
	/**
	 * JassTafel vorne 
	 * @author Daniel Tiefenauer
	 */
	public class JassTafelVorne extends SkinnableComponent
	{
		[SkinPart(required="true")]
		public var team1ScoreDisplay:IDisplayText;
		
		[SkinPart(required="true")]
		public var team2ScoreDisplay:IDisplayText;
		
		[Bindable] public var jass:IJass;
		
		override protected function createChildren():void{
			super.createChildren();
			
			team1ScoreDisplay.text = jass.team1Score + ' Punkte';
			team2ScoreDisplay.text = jass.team2Score + ' Punkte';
		}
		public function set team1Score(value:Number):void{
			if (jass.team1Score == value)
				return;
		}
		public function get team1Score():Number{
			return jass.team1Score;
		}
		public function get team2Score():Number{
			return jass.team2Score;
		}
		public function set team2Score(value:Number):void{
			if (jass.team2Score == value)
				return;
		}
	}
}