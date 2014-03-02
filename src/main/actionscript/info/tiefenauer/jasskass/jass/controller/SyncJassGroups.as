package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.profile.events.AzureGroupEvent;
	import info.tiefenauer.jasskass.profile.events.JassGroupProxyEvent;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	public class SyncJassGroups extends SimpleCommand
	{
		[Inject] public var event:JassGroupProxyEvent;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function execute():void{
			super.execute();
			
			var unSynced:Vector.<IJassGroup> = jassGroupProxy.jassGroups.filter(function(item:JassGroup, index:int, vector:Vector.<IJassGroup>):Boolean{
				return !item.isSynced;
			});
			for each(var group:IJassGroup in unSynced){
				dispatch(new AzureGroupEvent(AzureGroupEvent.ADD_GROUP, group));
			}
		}
		
	}
}