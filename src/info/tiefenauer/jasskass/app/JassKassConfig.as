package info.tiefenauer.jasskass.app
{
	import info.tiefenauer.jasskass.addon.balance.views.BalanceViewMediator;
	import info.tiefenauer.jasskass.addon.balance.views.interfaces.IBalanceView;
	import info.tiefenauer.jasskass.addon.balance.views.phone.BalanceView;
	import info.tiefenauer.jasskass.addon.counter.views.CounterViewMediator;
	import info.tiefenauer.jasskass.addon.counter.views.OAuthRequestViewMediator;
	import info.tiefenauer.jasskass.addon.counter.views.OAuthResponseViewMediator;
	import info.tiefenauer.jasskass.addon.counter.views.interfaces.ICounterView;
	import info.tiefenauer.jasskass.addon.counter.views.phone.CounterView;
	import info.tiefenauer.jasskass.addon.counter.views.phone.OAuthRequestView;
	import info.tiefenauer.jasskass.addon.counter.views.phone.OAuthResponseView;
	import info.tiefenauer.jasskass.addon.profile.views.ProfileViewMediator;
	import info.tiefenauer.jasskass.addon.profile.views.interfaces.IProfileView;
	import info.tiefenauer.jasskass.addon.profile.views.phone.ProfileView;
	import info.tiefenauer.jasskass.addon.statistics.views.StatisticsViewMediator;
	import info.tiefenauer.jasskass.addon.statistics.views.interfaces.IStatisticsView;
	import info.tiefenauer.jasskass.addon.statistics.views.phone.StatisticsView;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	public class JassKassConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var contextView:ContextView;
		
		public function configure():void
		{
			mediatorMap.map(ICounterView).toMediator(CounterViewMediator);
			mediatorMap.map(IBalanceView).toMediator(BalanceViewMediator);
			mediatorMap.map(IProfileView).toMediator(ProfileViewMediator);
			mediatorMap.map(IStatisticsView).toMediator(StatisticsViewMediator);
			mediatorMap.map(OAuthRequestView).toMediator(OAuthRequestViewMediator);
			mediatorMap.map(OAuthResponseView).toMediator(OAuthResponseViewMediator);
		}
	}
}