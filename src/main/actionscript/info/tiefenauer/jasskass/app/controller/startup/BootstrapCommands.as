package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.NavigateBackCommand;
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.event.InitializationEvent;
	import info.tiefenauer.jasskass.app.views.MobileView;
	import info.tiefenauer.jasskass.azure.event.AzureJassEvent;
	import info.tiefenauer.jasskass.jass.controller.AddPenalty;
	import info.tiefenauer.jasskass.jass.controller.AddPoints;
	import info.tiefenauer.jasskass.jass.controller.AddStoeck;
	import info.tiefenauer.jasskass.jass.controller.AddWys;
	import info.tiefenauer.jasskass.jass.controller.CheckPenalty;
	import info.tiefenauer.jasskass.jass.controller.FinishJass;
	import info.tiefenauer.jasskass.jass.controller.HideScore;
	import info.tiefenauer.jasskass.jass.controller.LoadJassesFromFile;
	import info.tiefenauer.jasskass.jass.controller.LoadJassesFromServer;
	import info.tiefenauer.jasskass.jass.controller.NewGame;
	import info.tiefenauer.jasskass.jass.controller.NewJass;
	import info.tiefenauer.jasskass.jass.controller.SaveJassesToFile;
	import info.tiefenauer.jasskass.jass.controller.SaveJassesToServer;
	import info.tiefenauer.jasskass.jass.controller.ShowJassDetails;
	import info.tiefenauer.jasskass.jass.controller.ShowPenalty;
	import info.tiefenauer.jasskass.jass.controller.StartJass;
	import info.tiefenauer.jasskass.jass.controller.SyncJasses;
	import info.tiefenauer.jasskass.jass.controller.UpdateJass;
	import info.tiefenauer.jasskass.jass.controller.azure.AddAzureJass;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.event.JassGameEvent;
	import info.tiefenauer.jasskass.jass.event.PenaltyEvent;
	import info.tiefenauer.jasskass.jass.event.PointsEvent;
	import info.tiefenauer.jasskass.jass.event.WysEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.kass.controller.CreateKassEntry;
	import info.tiefenauer.jasskass.kass.controller.DownloadKassData;
	import info.tiefenauer.jasskass.kass.controller.SaveKassDataToFile;
	import info.tiefenauer.jasskass.kass.controller.SyncKassData;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.profile.controller.ChangeCurrentJassGroup;
	import info.tiefenauer.jasskass.profile.controller.CreateJassPlayer;
	import info.tiefenauer.jasskass.profile.controller.JoinGroup;
	import info.tiefenauer.jasskass.profile.controller.LoadJassGroupsFromFile;
	import info.tiefenauer.jasskass.profile.controller.SaveJassGroupsToFile;
	import info.tiefenauer.jasskass.profile.controller.azure.AddAzureJassGroup;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.AzurePlayerEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.events.JoinGroupEvent;
	
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
			commandMap.map(JassEvent.START_JASS).toCommand(StartJass);
			commandMap.map(JassEvent.FINISH_JASS).toCommand(FinishJass);
			commandMap.map(JassEvent.SHOW_PENALTY).toCommand(ShowPenalty);
			commandMap.map(JassEvent.CHECK_PENALTY).toCommand(CheckPenalty);
			commandMap.map(JassEvent.HIDE_PENALTY).toCommand(HideScore);
			commandMap.map(JassEvent.SHOW_JASS_DETAIL).toCommand(ShowJassDetails);
			commandMap.map(JassEvent.CREATE_KASS_ENTRY).toCommand(CreateKassEntry);
			
			// JassGroup
			commandMap.map(JassGroupEvent.NEW_JASS_WITH_GROUP).toCommand(NewJass);
			
			// JassGame
			commandMap.map(JassGameEvent.NEW_GAME).toCommand(NewGame);
			
			
			// JassGroup
			commandMap.map(JassGroupEvent.CHANGE_CURRENT_GROUP).toCommand(ChangeCurrentJassGroup);
			
			// JassProxy
			commandMap.map(JassProxyEvent.SAVE_JASSES_TO_FILE).toCommand(SaveJassesToFile);
			commandMap.map(JassProxyEvent.SAVE_JASSES_TO_SERVER).toCommand(SaveJassesToServer);
			commandMap.map(JassProxyEvent.LOAD_JASSES_FROM_FILE).toCommand(LoadJassesFromFile);
			commandMap.map(JassProxyEvent.LOAD_JASSES_FROM_SERVER).toCommand(LoadJassesFromServer);
			commandMap.map(JassProxyEvent.SYNC_JASSES).toCommand(SyncJasses);
			
			// JassGroupProxy
			commandMap.map(JassGroupProxyEvent.SAVE_JASS_GROUPS_TO_FILE).toCommand(SaveJassGroupsToFile);
			commandMap.map(JassGroupProxyEvent.LOAD_JASS_GROUPS_FROM_FILE).toCommand(LoadJassGroupsFromFile);

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
			commandMap.map(KassEvent.SYNC_KASS_DATA).toCommand(SyncKassData);
			commandMap.map(KassEvent.SAVE_KASS_DATA).toCommand(SaveKassDataToFile);
			
			// Azure-Events
			commandMap.map(AzureJassEvent.ADD_JASS).toCommand(AddAzureJass);
			commandMap.map(AzureGroupEvent.ADD_GROUP).toCommand(AddAzureJassGroup);
			commandMap.map(AzurePlayerEvent.CREATE_PLAYER).toCommand(CreateJassPlayer);
			commandMap.map(JoinGroupEvent.JOIN_GROUP).toCommand(JoinGroup);
			commandMap.map(AzureJassEvent.UPDATE_JASS).toCommand(UpdateJass);
		}
	}
}