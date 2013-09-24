package info.tiefenauer.jasskass.app
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import info.tiefenauer.jasskass.app.controller.startup.BootstrapCommands;
	import info.tiefenauer.jasskass.app.controller.startup.BootstrapModels;
	import info.tiefenauer.jasskass.app.controller.startup.BootstrapViews;
	import info.tiefenauer.jasskass.app.controller.startup.StartupCommand;
	import info.tiefenauer.jasskass.app.event.StartupEvent;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * App Config 
	 * @author Daniel Tiefenauer
	 */
	public class JassKassConfig implements IConfig
	{
		public static const BOOTSTRAP_COMMANDS:String = 'BootstrapControllers';
		public static const BOOTSTRAP_MODELS:String = 'BootstrapModels';
		public static const BOOTSTRAP_VIEWS:String = 'BootstrapViews';
		
		[Inject] public var injector:IInjector;
		[Inject] public var mediatorMap:IMediatorMap;
		[Inject] public var commandMap:IEventCommandMap;
		[Inject] public var contextView:ContextView;
		[Inject] public var eventDispatcher:IEventDispatcher;
		
		public function configure():void
		{
			commandMap.map(BOOTSTRAP_COMMANDS).toCommand(BootstrapCommands);
			commandMap.map(BOOTSTRAP_MODELS).toCommand(BootstrapModels);
			commandMap.map(BOOTSTRAP_VIEWS).toCommand(BootstrapViews);
			commandMap.map(StartupEvent.STARTUP).toCommand(StartupCommand);
			
			eventDispatcher.dispatchEvent(new Event(BOOTSTRAP_COMMANDS));
			eventDispatcher.dispatchEvent(new Event(BOOTSTRAP_MODELS));
			eventDispatcher.dispatchEvent(new Event(BOOTSTRAP_VIEWS));
			eventDispatcher.dispatchEvent(new StartupEvent(StartupEvent.STARTUP));
		}
	}
}