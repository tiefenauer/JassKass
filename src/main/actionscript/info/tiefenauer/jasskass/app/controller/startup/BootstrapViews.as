/**
 * BootstrapViews.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.balance.views.BalanceViewMediator;
	import info.tiefenauer.jasskass.balance.views.interfaces.IBalanceView;
	import info.tiefenauer.jasskass.jass.views.JassGameViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassListViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassScoreViewMediator;
	import info.tiefenauer.jasskass.jass.views.TeamBuilderViewMediator;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassGameView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassListView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassScoreView;
	import info.tiefenauer.jasskass.jass.views.interfaces.ITeamBuilderView;
	import info.tiefenauer.jasskass.profile.views.ProfileViewMediator;
	import info.tiefenauer.jasskass.profile.views.interfaces.IProfileView;
	import info.tiefenauer.jasskass.statistics.views.StatisticsViewMediator;
	import info.tiefenauer.jasskass.statistics.views.interfaces.IStatisticsView;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
	/**
	 * Bootstrap views/mediators 
	 * @author Daniel Tiefenauer
	 */
	public class BootstrapViews extends SimpleCommand
	{
		[Inject] public var mediatorMap:IMediatorMap;
		
		override public function execute():void{
			super.execute();
			// jass
			mediatorMap.map(ITeamBuilderView).toMediator(TeamBuilderViewMediator);
			mediatorMap.map(IJassListView).toMediator(JassListViewMediator);
			mediatorMap.map(IJassGameView).toMediator(JassGameViewMediator);
			mediatorMap.map(IJassScoreView).toMediator(JassScoreViewMediator);
			
			// balance
			mediatorMap.map(IBalanceView).toMediator(BalanceViewMediator);
			
			// profile
			mediatorMap.map(IProfileView).toMediator(ProfileViewMediator);
			
			// statistics
			mediatorMap.map(IStatisticsView).toMediator(StatisticsViewMediator);
		}
	}
}