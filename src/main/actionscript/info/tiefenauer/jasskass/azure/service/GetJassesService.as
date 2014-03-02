package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	
	import info.tiefenauer.jasskass.jass.model.factory.JassFactory;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import org.osflash.signals.Signal;

	public class GetJassesService extends AzureService
	{
		/**
		 * Constructor 
		 */
		public function GetJassesService(){
			super('getjasses/');
			onSuccess = new Signal(Vector.<IJass>);
			_completeHandler = onJassesDownloaded;
		}
		
		public function getJasses(group:IJassGroup):void{
			if (group.id && group.id.length > 0){
				byId(group.id);
			}
			else if (group.key && group.key.length > 0){
				byKey(group.key);
			}
			else{
				throw(new Error('Key und/oder ID müssen angegeben werden!'));
			}
		}
		
		private function byId(id:String):void{
			_endpoint += 'byId?';
			_endpoint += 'groupId=' + id;			
			GET();
		}
		private function byKey(key:String):void{
			_endpoint += 'byKey?';
			_endpoint += 'groupKey=' + key;
			GET();
		}
		
		/**
		 * Request complete 
		 * @param event
		 */
		private function onJassesDownloaded(event:Event):void{
			try{
				var responseObj:Object = JSON.parse(urlLoader.data);
				var jassesObj:Object = responseObj['jasses'];
				var groupObj:Object = responseObj['group'];
				
				var group:IJassGroup = JassGroupFactory.fromObject(groupObj);
				
				var jasses:Vector.<IJass> = new Vector.<IJass>();
				for each(var jassObj:Object in jassesObj){
					var result:Vector.<IJassPlayer>;
					var playerId:String;
					var filterByPlayer:Function = function(item:IJassPlayer, index:int, vector:Vector.<IJassPlayer>):Boolean{
						return item.id == playerId;
					};
					var jass:IJass = JassFactory.fromAzureObject(jassObj);
					for (var key:String in jassObj) switch(key){
						case 't1p1id':
							playerId = jassObj[key];
							result = group.players.filter(filterByPlayer);
							if (result.length > 0)
								jass.team1.player1 = result[0];
							break;
						case 't1p2id':
							playerId = jassObj[key];
							result = group.players.filter(filterByPlayer);
							if (result.length > 0)
								jass.team1.player2 = result[0];
							break;
						case 't2p1id':
							playerId = jassObj[key];
							result = group.players.filter(filterByPlayer);
							if (result.length > 0)
								jass.team2.player1 = result[0];
							break;
						case 't2p2id':
							playerId = jassObj[key];
							result = group.players.filter(filterByPlayer);
							if (result.length > 0)
								jass.team2.player2 = result[0];
							break;
					}
					jasses.push(jass);
				}
				onSuccess.dispatch(jasses);
			}
			catch(error:Error){
				onError.dispatch(error);
			}
		}
	}
}