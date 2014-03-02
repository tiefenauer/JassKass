package info.tiefenauer.jasskass.app.model.rest
{
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLStream;
	
	
	import org.osflash.signals.Signal;
	import info.tiefenauer.jasskass.app.model.Actor;

	public class RESTClient extends Actor
	{
		public var urlLoader:URLLoader; // must be public for mocking
		public var urlStream:URLStream; // must be public for mocking
		
		// Signals
		public var onProgress:Signal = new Signal(Object);
		public var onError:Signal = new Signal(Object);
		public var onSuccess:Signal = new Signal(Object); // muss vom Aufrufer überschrieben werden
		
		public function RESTClient(){
			urlLoader = new URLLoader();
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, handleHTTPStatus);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleHTTPStatus);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, handleProgress);
			
			urlStream = new URLStream();
			urlStream.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			urlStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
			urlStream.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, handleHTTPStatus);
			urlStream.addEventListener(HTTPStatusEvent.HTTP_STATUS, handleHTTPStatus);
			urlStream.addEventListener(ProgressEvent.PROGRESS, handleProgress);
		}
		
		//-----------------------------------
		// Event handlers
		//-----------------------------------
		private function handleProgress(event:ProgressEvent):void{
			onProgress.dispatch(event);
		}
		private function handleIOError(event:IOErrorEvent):void{
			trace(event);
			onError.dispatch(new RESTClientError(RESTClientError.UNKNOWN));
		}
		private function handleSecurityError(event:SecurityErrorEvent):void{
			trace(event);
			onError.dispatch(new RESTClientError(RESTClientError.UNKNOWN));
		}
		private function handleHTTPStatus(event:HTTPStatusEvent):void{
			trace(event);
			switch(event.status){
				// Bad request
				case 400:
					onError.dispatch(new RESTClientError(RESTClientError.BAD_REQUEST_400));
					break;
				// Unauthorized
				case 401:
					onError.dispatch(new RESTClientError(RESTClientError.UNAUTHORIZED_401));
					break;
				// Not Found
				case 404:
					onError.dispatch(new RESTClientError(RESTClientError.NOT_FOUND_404));
					//onLearningObjectDownloadOK.removeAll();
					break;
				// Internal Server Error
				case 500:
					onError.dispatch(new RESTClientError(RESTClientError.INTERNAL_SERVER_ERROR_500));
					break;
			}
		}		
	}
}