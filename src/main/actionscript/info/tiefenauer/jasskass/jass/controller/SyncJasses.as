package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.azure.event.AzureJassEvent;
	import info.tiefenauer.jasskass.azure.service.JassService;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class SyncJasses extends SimpleCommand
	{
		[Inject] public var event:JassProxyEvent;
		[Inject] public var getJassesService:JassService;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;

		private var synced:Vector.<IJass>;
		
		override public function execute():void{
			super.execute();
			// noch nicht synchronisierte senden
			var unSynced:Vector.<IJass> = jassProxy.jassList.filter(function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
				return !item.isSynced;
			});
			for each(var jass:IJass in unSynced){
				dispatch(new AzureJassEvent(AzureJassEvent.ADD_JASS, jass));
			}

			dispatch(new JassProxyEvent(JassProxyEvent.LOAD_JASSES_FROM_SERVER));
		}
		
	}
}