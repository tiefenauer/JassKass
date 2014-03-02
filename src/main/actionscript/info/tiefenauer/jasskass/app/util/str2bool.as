package info.tiefenauer.jasskass.app.util
{
	public function str2bool(value:String):Boolean{
		switch(value) {
			case '1':
			case 'true':
			case 'yes':
				return true;
			case '0':
			case 'false':
			case 'no':
				return false;
			default:
				return Boolean(value);
		}
		return false;
	}
}