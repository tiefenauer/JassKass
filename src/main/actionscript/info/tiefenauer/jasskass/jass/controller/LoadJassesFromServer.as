package info.tiefenauer.jasskass.jass.controller
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.azure.service.GetJassesService;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * Jass-Liste von Server herunterladen 
	 * @author Daniel
	 */
	public class LoadJassesFromServer extends SimpleCommand
	{
		[Inject] public var event:JassProxyEvent;
		[Inject] public var service:GetJassesService;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		
		override public function execute():void{
			super.execute();

			if (jassGroupProxy.currentJassGroup){
				detain();
				service.onSuccess.addOnce(onJassesLoaded);
				service.getJasses(jassGroupProxy.currentJassGroup);
			}
		}
		
		private function onJassesLoaded(jasses:Vector.<IJass>):void{
			release();
			for each(var jass:IJass in jasses){
				jass.isSynced = true;
				jass.group = jassGroupProxy.currentJassGroup;
				jassProxy.addJass(jass);
			}

			// heruntergeladene liste hinzufügen und alle lokalen jasse, welche nicht in der heruntergeladenen liste sind, löschen
			/*
			for each(var localJass:IJass in jassProxy.jassList){
				var inBothLists:Vector.<IJass> = jasses.filter(function(item:IJass, index:int, vector:Vector.<IJass>):Boolean{
					return localJass.isSynced && item.id == localJass.id;
				});
				if (inBothLists.length == 0)
					jassProxy.removeJass(localJass.id);
			}
			*/
			dispatch(new JassProxyEvent(JassProxyEvent.SAVE_JASSES_TO_FILE));
		}
	}
}