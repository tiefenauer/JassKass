/**
 * SettingsViewBase.as
 *
 * Project: JassKass
 * Date: Jun 3, 2014
 * 
 * @package		info.tiefenauer.jasskass.settings.views.base
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */

package info.tiefenauer.jasskass.settings.views.base
{
	import mx.collections.ArrayCollection;
	
	import info.tiefenauer.jasskass.app.views.MobileView;
	
	/**
	 * 
	 * @author dtie
	 */
	public class SettingsViewBase extends MobileView
	{
		public function SettingsViewBase(){
			super();
			data = new ArrayCollection();
		}
		

		//--------------------------------
		// Getter/Setter
		//--------------------------------
		[Bindable]
		public function get settings():ArrayCollection{
			if (data is ArrayCollection)
				return data as ArrayCollection;
			return null;
		}
		public function set settings(value:ArrayCollection):void{
			data = value;
		}
	}
}