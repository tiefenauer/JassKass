package info.tiefenauer.jasskass.azure.model
{
	public class AzureObject implements IAzureObject
	{
		private var _isSynced:Boolean = false;

		public function get isSynced():Boolean{
			return _isSynced;
		}
		public function set isSynced(value:Boolean):void{
			_isSynced = value;
		}
	}
}