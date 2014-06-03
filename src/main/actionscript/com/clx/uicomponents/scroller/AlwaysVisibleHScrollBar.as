/**
 * AlwaysVisibleHScrollBar.as
 *
 * Project: CLX.UIComponents
 * Date: Jul 1, 2013
 * 
 * @package		com.clx.uicomponents.scroller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 */
package com.clx.uicomponents.scroller
{
    import spark.components.HScrollBar;
    
    /**
    * A Scroller with interactionMode="touch" fades the scrollbars away
    * after they are shown for a brief period of time.  This class
    * overrides that behavior to never fade away the HScrollBar. 
    */
    public class AlwaysVisibleHScrollBar extends HScrollBar
    {
        override public function set alpha(value:Number):void {
            //trace('ignore alpha', value);
        }
        
        override public function set visible(value:Boolean):void {
            //trace('ignore visible', value);
        }
        
        override public function set includeInLayout(value:Boolean):void {
            //trace('ignore includeInLayout', value);
        }
        
        override public function set scaleX(value:Number):void {
            //trace('ignore scaleX', value);
        }
        
        override public function set scaleY(value:Number):void {
            //trace('ignore scaleY', value);
        }
    }
}