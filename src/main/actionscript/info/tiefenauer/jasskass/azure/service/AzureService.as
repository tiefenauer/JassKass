package info.tiefenauer.jasskass.azure.service
{
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	
	import info.tiefenauer.jasskass.app.model.rest.RESTClient;
	
	/**
	 * 
	 * @author Daniel
	 */
	public class AzureService extends RESTClient
	{
		protected static var URL:String;
		protected var _endpoint:String;
		protected var _headers:Array = new Array();
		protected var _body:Object;
		protected var _completeHandler:Function;
		
		/**
		 * 
		 * 
		 */
		public function AzureService(endpoint:String){
			super();
			_endpoint = endpoint;
		}
		
		[PostConstruct]
		public function init():void{
			URL = 'https://jaskass.azure-mobile.net/api/';
		}
		
		protected function GET():void{
			var request:URLRequest = getURLRequest();
			request.method = URLRequestMethod.GET;
			urlLoader.addEventListener(Event.COMPLETE, _completeHandler);
			urlLoader.load(request);
		}
		protected function POST():void{
			var request:URLRequest = getURLRequest();
			if(_body)
				request.data = JSON.stringify(_body);
			request.method = URLRequestMethod.POST;
			urlLoader.addEventListener(Event.COMPLETE, _completeHandler);
			urlLoader.load(request);
		}
		
		//-----------------------------
		// Protected functions
		//-----------------------------
		/**
		 * Request vorbereiten 
		 * @param user
		 * @return 
		 */
		protected function getURLRequest():URLRequest{
			var request:URLRequest = new URLRequest(URL + _endpoint);
			request.requestHeaders = [
				new URLRequestHeader('Content-Type', 'application/json'),
			].concat(_headers);
			return request;
		}
	}
}