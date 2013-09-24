/**
 * BootstrapViews.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.controller.startup
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.balance.views.BalanceViewMediator;
	import info.tiefenauer.jasskass.balance.views.interfaces.IBalanceView;
	import info.tiefenauer.jasskass.counter.views.CounterViewMediator;
	import info.tiefenauer.jasskass.counter.views.OAuthRequestViewMediator;
	import info.tiefenauer.jasskass.counter.views.OAuthResponseViewMediator;
	import info.tiefenauer.jasskass.counter.views.interfaces.ICounterView;
	import info.tiefenauer.jasskass.counter.views.phone.OAuthRequestView;
	import info.tiefenauer.jasskass.counter.views.phone.OAuthResponseView;
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
			mediatorMap.map(ICounterView).toMediator(CounterViewMediator);
			mediatorMap.map(IBalanceView).toMediator(BalanceViewMediator);
			mediatorMap.map(IProfileView).toMediator(ProfileViewMediator);
			mediatorMap.map(IStatisticsView).toMediator(StatisticsViewMediator);
			mediatorMap.map(OAuthRequestView).toMediator(OAuthRequestViewMediator);
			mediatorMap.map(OAuthResponseView).toMediator(OAuthResponseViewMediator);
		}
	}
}