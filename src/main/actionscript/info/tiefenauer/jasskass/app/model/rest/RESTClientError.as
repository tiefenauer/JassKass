package info.tiefenauer.jasskass.app.model.rest
{
	/**
	 * Error Klasse für REST Clients 
	 * @author Daniel
	 * 
	 */
	public class RESTClientError extends Error
	{
		public static const NAME:String = 'RESTClientError';
		// Error messages
		public static const BAD_REQUEST_400:int = 400;
		public static const BAD_REQUEST_400_MSG:String = 'HTTP/1.1 400 Bad Request';
		public static const UNAUTHORIZED_401:int = 401;
		public static const UNAUTHORIZED_401_MSG:String = 'HTTP/1.0 401 Unauthorized';
		public static const NOT_FOUND_404:int = 404;
		public static const NOT_FOUND_404_MSG:String = 'HTTP/1.1 404 Not Found';
		public static const INTERNAL_SERVER_ERROR_500:int = 500;
		public static const INTERNAL_SERVER_ERROR_500_MSG:String = 'HTTP/1.1 500 Internal Server Error';
		public static const INVALID_JSON_DATA:int = 991
		public static const INVALID_JSON_DATA_MSG:String = 'Invalid JSON Data';
		public static const UNKNOWN:int = 999;
		public static const UNKNOWN_MSG:String = 'Unknown';
		
		/**
		 * Constructor 
		 * @param id
		 */
		public function RESTClientError(id:int){
			super(null, id);
			switch(id){
				case BAD_REQUEST_400:
					message = BAD_REQUEST_400_MSG;
					break;
				case UNAUTHORIZED_401:
					message = UNAUTHORIZED_401_MSG;
					break;
				case NOT_FOUND_404:
					message = NOT_FOUND_404_MSG;
					break;
				case INTERNAL_SERVER_ERROR_500:
					message = INTERNAL_SERVER_ERROR_500_MSG;
					break;
				case INVALID_JSON_DATA:
					message = INVALID_JSON_DATA_MSG;
					break;
				case UNKNOWN:
					message = UNKNOWN_MSG;
					break;
				default:
					message = '';
					break;
			}
		}
	}
}