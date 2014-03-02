package info.tiefenauer.jasskass.app.util
{
	import pl.mateuszmackowiak.nativeANE.notifications.Toast;

	public function toast(message:String, duration:int = 500):void{
		if(Toast.isSupported){
			Toast.show(message, duration);
		}
		else{
			trace('[Toast] ' + message);
		}
	}
}