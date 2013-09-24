/**
 * IXML.as
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.app.model.interfaces
{
	public interface IXML
	{
		function toXML():XML;
		function fromXML(value:XML):void;
	}
}