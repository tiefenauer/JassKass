/**
 * BootstrapViews.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.jass.views.JassDetailViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassGameViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassListViewMediator;
	import info.tiefenauer.jasskass.jass.views.JassPenaltyViewMediator;
	import info.tiefenauer.jasskass.jass.views.TeamBuilderViewMediator;
	import info.tiefenauer.jasskass.jass.views.base.JassListViewBase;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassDetailView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassGameView;
	import info.tiefenauer.jasskass.jass.views.interfaces.IJassPenaltyView;
	import info.tiefenauer.jasskass.jass.views.interfaces.ITeamBuilderView;
	import info.tiefenauer.jasskass.kass.views.KassEntryViewMediator;
	import info.tiefenauer.jasskass.kass.views.KassViewMediator;
	import info.tiefenauer.jasskass.kass.views.base.KassEntryViewBase;
	import info.tiefenauer.jasskass.kass.views.base.KassViewBase;
	import info.tiefenauer.jasskass.profile.views.GroupBuilderViewMediator;
	import info.tiefenauer.jasskass.profile.views.JassGroupListViewMediator;
	import info.tiefenauer.jasskass.profile.views.JassGroupViewMediator;
	import info.tiefenauer.jasskass.profile.views.JoinGroupViewMediator;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupListView;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJassGroupView;
	import info.tiefenauer.jasskass.profile.views.interfaces.IJoinGroupView;
	import info.tiefenauer.jasskass.profile.views.phone.GroupBuilderView;
	import info.tiefenauer.jasskass.settings.views.SettingsViewMediator;
	import info.tiefenauer.jasskass.settings.views.interfaces.ISettingsView;
	
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
			mediatorMap.map(JassListViewBase).toMediator(JassListViewMediator);
			mediatorMap.map(IJassGameView).toMediator(JassGameViewMediator);
			mediatorMap.map(IJassPenaltyView).toMediator(JassPenaltyViewMediator);
			mediatorMap.map(IJassDetailView).toMediator(JassDetailViewMediator);
			
			// kass
			mediatorMap.map(KassViewBase).toMediator(KassViewMediator);
			mediatorMap.map(KassEntryViewBase).toMediator(KassEntryViewMediator);
			
			// profile
			mediatorMap.map(IJassGroupView).toMediator(JassGroupViewMediator);
			mediatorMap.map(GroupBuilderView).toMediator(GroupBuilderViewMediator);
			mediatorMap.map(IJassGroupListView).toMediator(JassGroupListViewMediator);
			mediatorMap.map(IJoinGroupView).toMediator(JoinGroupViewMediator);
			
			// statistics
			mediatorMap.map(ISettingsView).toMediator(SettingsViewMediator);
		}
	}
}