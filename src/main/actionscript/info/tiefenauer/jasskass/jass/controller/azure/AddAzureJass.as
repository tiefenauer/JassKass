/**
 * CreatJass
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.controller.azure
{
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.util.Network;
	import info.tiefenauer.jasskass.azure.event.AzureJassEvent;
	import info.tiefenauer.jasskass.azure.service.JassService;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroupProxy;
	
	/**
	 * Erstelle Jass auf Azure 
	 * @author Daniel
	 * 
	 */
	public class AddAzureJass extends SimpleCommand
	{
		[Inject] public var event:AzureJassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var jassGroupProxy:IJassGroupProxy;
		[Inject] public var app:JassKass;
		[Inject] public var service:JassService;
		
		override public function execute():void{
			super.execute();
			if (Network.hasNetwork){
				detain();
				service.onSuccess.addOnce(onJassAdded);
				service.addJass(event.jass, jassGroupProxy.currentJassGroup);
			}
		}
		
		private function onJassAdded(jass:IJass):void{
			release();
			jass.group = jassGroupProxy.currentJassGroup;
			jass.isSynced = true;
			jassProxy.addJass(jass);
			dispatch(new JassProxyEvent(JassProxyEvent.SAVE_JASSES_TO_FILE));
			dispatch(new JassEvent(AzureJassEvent.JASS_ADDED, jass));
		}
	}
}