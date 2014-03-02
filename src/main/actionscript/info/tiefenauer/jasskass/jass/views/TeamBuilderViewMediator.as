package info.tiefenauer.jasskass.jass.views
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.app.views.SimpleMediator;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.vo.Jass;
	import info.tiefenauer.jasskass.jass.views.base.TeamBuilderViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.ITeamBuilderView;
	
	public class TeamBuilderViewMediator extends SimpleMediator
	{
		[Inject] public var view:ITeamBuilderView;
		
		override public function initialize():void{
			addViewListener(TeamBuilderViewBase.START_BUTTON_CLICKED, onStartButtonClicked);
			addViewListener(TeamBuilderViewBase.CANCEL_BUTTON_CLICKED, onCancelButtonClicked);
		}
		
		//---------------------------------
		// View Event Handlers
		//---------------------------------
		private function onStartButtonClicked(event:Event):void{
			var jass:IJass = new Jass();
			jass.team1.player1 = view.team1Player1;
			jass.team1.player2 = view.team1Player2;
			jass.team2.player1 = view.team2Player1;
			jass.team2.player2 = view.team2Player2;
			dispatch(new JassEvent(JassEvent.START_JASS, jass));
		}
		private function onCancelButtonClicked(event:Event):void{
			app.activeNavigator.popView();
		}
	}
}