package info.tiefenauer.jasskass.jass.controller
{
	import com.clx.uicomponents.popup.AlertPopup;
	
	import spark.events.PopUpEvent;
	
	import info.tiefenauer.jasskass.app.controller.SimpleCommand;
	import info.tiefenauer.jasskass.app.util.Network;
	import info.tiefenauer.jasskass.app.util.translate;
	import info.tiefenauer.jasskass.azure.event.AzureJassEvent;
	import info.tiefenauer.jasskass.jass.event.JassEvent;
	import info.tiefenauer.jasskass.jass.model.JassProxyEvent;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassProxy;
	
	/**
	 * 
	 * @author dtie
	 */
	public class FinishJass extends SimpleCommand
	{
		[Inject] public var event:JassEvent;
		[Inject] public var jassProxy:IJassProxy;
		[Inject] public var app:JassKass;
		
		/**
		 * 
		 */
		override public function execute():void{
			super.execute();
			var alertPopup:AlertPopup = new AlertPopup(AlertPopup.WARNING);
			alertPopup.title = translate('Jass Beenden?');
			alertPopup.message = translate('Wollen Sie wirklich beenden?');
			alertPopup.okButtonLabel = translate('Ja');
			alertPopup.cancelButtonLabel = translate('Nein');
			alertPopup.show();
			alertPopup.addEventListener(PopUpEvent.CLOSE, function(closeEvent:PopUpEvent):void{
				if (closeEvent.data == AlertPopup.OK){
					jassProxy.currentJass = null;
					jassProxy.addJass(event.jass);
					dispatch(new JassProxyEvent(JassProxyEvent.SAVE_JASSES_TO_FILE));
					if (Network.hasNetwork)
						dispatch(new AzureJassEvent(AzureJassEvent.ADD_JASS, event.jass));
					
					app.activeNavigator.popToFirstView();;
					dispatch(new JassEvent(JassEvent.JASS_FINISHED, event.jass));
					dispatch(new JassEvent(JassEvent.CREATE_KASS_ENTRY, event.jass));
				}
			});
		}
	}
}