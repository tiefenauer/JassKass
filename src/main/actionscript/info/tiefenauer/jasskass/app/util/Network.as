package info.tiefenauer.jasskass.app.util
{
	import flash.net.NetworkInfo;
	import flash.utils.getDefinitionByName;

	public class Network
	{
		public static function get hasWifi():Boolean{
			var hasWifi:Boolean = false;
			var vNetworkInterfaces:Object; 
			if (flash.net.NetworkInfo.isSupported) 
				vNetworkInterfaces = getDefinitionByName('flash.net.NetworkInfo')['networkInfo']['findInterfaces'](); 
			else 
				//vNetworkInterfaces = getDefinitionByName('com.adobe.nativeExtensions.Networkinfo.NetworkInfo')['networkInfo']['findInterfaces']();
				vNetworkInterfaces = new Object();
			
			for each (var networkInterface:Object in vNetworkInterfaces) 
			{ 
				trace(" active: " + networkInterface.active );
				trace( "displayName: " + networkInterface.displayName );
				trace( "name: " + networkInterface.name );
				trace( "hwAddress: " + networkInterface.hardwareAddress );
				trace( "--------------------" ); 
				
				if (networkInterface.active){
					var name:String = networkInterface.name;
					/*
					if (SystemProperties.isIOS())
						hasWifi = (name == "en0" || name == "en1");
					else
						hasWifi = (name.toLowerCase().indexOf('wifi') > -1 || networkInterface.displayName == 'Local Area Connection'
						);
					*/
					hasWifi = (networkInterface.displayName.toLowerCase().indexOf('ethernet') > -1 || networkInterface.displayName.toLowerCase().indexOf('wifi') > -1 || networkInterface.displayName == 'Local Area Connection');
				}
				

				if (hasWifi)
					return true;
			} 
			return hasWifi;
			
		}
		
		public static function get hasMobile():Boolean{
			var hasMobile:Boolean = false;
			var vNetworkInterfaces:Object; 
			if (flash.net.NetworkInfo.isSupported) 
				vNetworkInterfaces = getDefinitionByName('flash.net.NetworkInfo')['networkInfo']['findInterfaces'](); 
			else 
				//vNetworkInterfaces = getDefinitionByName('com.adobe.nativeExtensions.Networkinfo.NetworkInfo')['networkInfo']['findInterfaces']();
				vNetworkInterfaces = new Object();
			
			for each (var networkInterface:Object in vNetworkInterfaces) 
			{ 
				if (networkInterface.active){
					var name:String = networkInterface.name;
					/*
					if (SystemProperties.isIOS())
						hasMobile = (name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2");
					else
						hasMobile = (name.toLowerCase().indexOf('mobile') > -1);
					*/
					hasMobile = (name.toLowerCase().indexOf('mobile') > -1);
				}
				trace( "active: " + networkInterface.active );
				trace( "displayName: " + networkInterface.displayName );
				trace( "name: " + networkInterface.name );
				trace( "hwAddress: " + networkInterface.hardwareAddress );
				trace( "--------------------" ); 
			} 
			return hasMobile;
		}
		
		public static function get hasNetwork():Boolean{
			//return false;
			if (Debug.simulator)
				return Debug.network;
			return hasMobile || hasWifi;
		}		
	}
}