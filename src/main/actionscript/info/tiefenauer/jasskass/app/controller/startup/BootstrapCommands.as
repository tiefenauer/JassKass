package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.NavigateBackCommand;
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.jass.controller.AddPenalty;
	import info.tiefenauer.jasskass.jass.controller.AddPoints;
	import info.tiefenauer.jasskass.jass.controller.AddStoeck;
	import info.tiefenauer.jasskass.jass.controller.AddWys;
	import info.tiefenauer.jasskass.jass.controller.CreateJass;
	import info.tiefenauer.jasskass.jass.controller.FinishJass;
	import info.tiefenauer.jasskass.jass.controller.HideScore;
	import info.tiefenauer.jasskass.jass.controller.LoadJassesFromFile;
	import info.tiefenauer.jasskass.jass.controller.NewJass;
	import info.tiefenauer.jasskass.jass.controller.SaveJassesToFile;
	import info.tiefenauer.jasskass.jass.controller.SetJassGameFactor;
	import info.tiefenauer.jasskass.jass.controller.ShowJassDetails;
	import info.tiefenauer.jasskass.jass.controller.ShowScore;
	import info.tiefenauer.jasskass.jass.controller.StartJass;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.JassGameEvent;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.kass.controller.DownloadKassData;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.profile.controller.CreateJassGroup;
	import info.tiefenauer.jasskass.profile.controller.CreateJassPlayer;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.AzurePlayerEvent;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
	/**
	 * Bootstrap events/commands 
	 * @author Daniel Tiefenauer
	 * 
	 */
	public class BootstrapCommands extends SimpleCommand
	{
		[Inject] public var commandMap:IEventCommandMap;
		
		override public function execute():void{
			super.execute();
			// general
			commandMap.map(MobileView.BACK).toCommand(NavigateBackCommand);

			
			// Initialization
			commandMap.map(InitializationEvent.LOAD_APP_CONFIG).toCommand(LoadAppConfiguration);
			commandMap.map(InitializationEvent.GET_GOOGLE_API_TOKEN).toCommand(GetOAuth2AccessToken);
			
			// Jass
			commandMap.map(JassEvent.NEW_JASS).toCommand(NewJass);
			commandMap.map(JassEvent.CREATE_JASS).toCommand(CreateJass);
			commandMap.map(JassEvent.START_JASS).toCommand(StartJass);
			commandMap.map(JassEvent.FINISH_JASS).toCommand(FinishJass);
			commandMap.map(JassEvent.SHOW_PENALTY).toCommand(ShowScore);
			commandMap.map(JassEvent.HIDE_PENALTY).toCommand(HideScore);
			commandMap.map(JassEvent.SHOW_JASS_DETAIL).toCommand(ShowJassDetails);
			
			// JassGame
			commandMap.map(JassGameEvent.SET_FACTOR).toCommand(SetJassGameFactor);
			
			// JassProxy
			commandMap.map(JassProxyEvent.SAVE_JASSES).toCommand(SaveJassesToFile);
			commandMap.map(JassProxyEvent.LOAD_JASSES).toCommand(LoadJassesFromFile);

			// Points
			commandMap.map(PointsEvent.ADD_POINTS).toCommand(AddPoints);
			
			// Score
			commandMap.map(PenaltyEvent.BERGPREIS).toCommand(AddPenalty);
			commandMap.map(PenaltyEvent.SIEG).toCommand(AddPenalty);
			commandMap.map(PenaltyEvent.MATCH).toCommand(AddPenalty);
			commandMap.map(PenaltyEvent.KONTERMATCH).toCommand(AddPenalty);
			commandMap.map(PenaltyEvent.VIER_BAUERN).toCommand(AddPenalty);
			
			// Wyses
			commandMap.map(WysEvent.WYS).toCommand(AddWys);
			commandMap.map(WysEvent.STOECK).toCommand(AddStoeck);
			
			// JassKass
			commandMap.map(KassEvent.DOWNLOAD_KASS_DATA).toCommand(DownloadKassData);
			
			// Azure-Events
			commandMap.map(AzureGroupEvent.CREATE_GROUP).toCommand(CreateJassGroup);
			commandMap.map(AzurePlayerEvent.CREATE_PLAYER).toCommand(CreateJassPlayer);
		}
	}
}