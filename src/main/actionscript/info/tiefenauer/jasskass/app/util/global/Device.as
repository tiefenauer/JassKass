/**
 * Device.as
 *
 * Project: JassKass
 * Date: Jun 10, 2014
 * 
 * @package		info.tiefenauer.jasskass.app.util.global
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.app.util.global
{
	import flash.display.Stage;
	import flash.system.Capabilities;
	
	import mx.core.FlexGlobals;
	
	import pl.mateuszmackowiak.nativeANE.properties.SystemProperties;

	public class Device
	{
		//--------------------------------
		// Public constants
		//--------------------------------
		/**
		 * Gerät ist ein Smartphone (Bildschirmdiagonale &lt; 5") 
		 */
		public static var IS_PHONE:Boolean = formFactor == FORM_FACTOR_PHONE;
		/**
		 * Gerät ist ein Smartphone (Bildschirmdiagonale &gt;= 5") 
		 */
		public static var IS_TABLET:Boolean = formFactor == FORM_FACTOR_TABLET;
		
		
		/**
		 * OS-Konstante für iOS
		 */
		public static const IOS:String = 'iOS';
		/**
		 * OS-Konstante für Android 
		 */
		public static const ANDROID:String = 'Android';
		/**
		 * OS-Konstante für Windows 
		 */
		public static const WINDOWS:String = 'Windows';
		/**
		 * OS-Konstante für unbekanntes Betriebssystem 
		 */
		public static const UNKNOWN:String = 'Unknown';
		/**
		 * <p>OS des Geräts, auf dem die App läuft</p>
		 * <p>Der Rückgabewert ist ein String, welcher einer der OS-Konstanten entspricht</p>
		 * @return 
		 */
		public static function get osType():String{
			if (SystemProperties.isSupported){
				if (SystemProperties.isIOS())
					return IOS;
				if (SystemProperties.isAndroid())
					return ANDROID;
			}
			else {
				if (Capabilities.os.indexOf('iPhone') > -1)
					return IOS;
				if (Capabilities.os.indexOf('iPad') > -1)
					return IOS;
				if (Capabilities.os.indexOf('Windows') > -1)
					return WINDOWS;
				return ANDROID;
			}
			return UNKNOWN;
		}
		
		
		/**
		 * Formfaktor-Konstante "Tablet" (Bildschirmdiagonale &gt;= 5") 
		 */
		public static const FORM_FACTOR_TABLET:String = 'tablet';
		/**
		 * Formfaktor-Konstante "Smartphone" (Bildschirmdiagonale &lt; 5") 
		 */
		public static const FORM_FACTOR_PHONE:String = 'phone';
		/**
		 * <p>Formfaktor (Smartphone oder Tablet) des Gerätes ermitteln, auf dem die App läuft</p>
		 * <p>Der Rückgabewert ist ein String, welcher einer der Formfaktor-Konstanten entspricht</p>
		 * @return 
		 */
		public static function get formFactor():String {
			var stage:Stage = FlexGlobals.topLevelApplication.stage;
			if (!stage)
				stage = FlexGlobals.topLevelApplication.systemManager.stage;
			
			var _width : Number = Math.max( stage.stageWidth, stage.stageHeight );
			var _height : Number = Math.min( stage.stageWidth, stage.stageHeight );
			
			_width = _width / FlexGlobals.topLevelApplication.runtimeDPI;
			_height = _height / FlexGlobals.topLevelApplication.runtimeDPI;
			
			//this will resolve to the physical size in inches... 
			//if greater than 5 inches, assume its a tablet
			if ( _width >= 5 )
				return FORM_FACTOR_TABLET;
			return FORM_FACTOR_PHONE;
		}
	}
}