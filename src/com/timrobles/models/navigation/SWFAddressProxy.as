package com.timrobles.models.navigation 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.graphikboutique.model.Sitemap;	

	/**	 * @author Tim Robles	 */	public class SWFAddressProxy extends EventDispatcher implements INavigationProxy
	{
		//----------------------------------
		//  Constants
		//----------------------------------
		
		public static const SEPARATOR:String = "/";
		
		//----------------------------------
		//  Protected Members
		//----------------------------------

		protected var sitemap:Sitemap;		
		protected var values:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function SWFAddressProxy(sitemap:Sitemap = null) 
		{
			this.sitemap = sitemap;
			init();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function getValue():String
		{
			return values.join(SEPARATOR);
		}
		
		public function getValues():Array
		{
			return values;
		}
		
		public function setValue(value:String):void
		{
			SWFAddress.setValue(value);
		}
		
		public function setValues(values:Array):void
		{
			SWFAddress.setValue(values.join(SEPARATOR));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		protected function changeHandler(swfAddressEvent:SWFAddressEvent):void
		{
			if (!SWFAddress.getValue())
				return;
			
			var value:String = SWFAddress.getValue();
			values = value.split(SEPARATOR);
			if (sitemap)
			{
				SWFAddress.setTitle(sitemap.generateTitle(value, SEPARATOR));
			}
			dispatchEvent(new Event(Event.CHANGE));
		}

		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		protected function init():void
		{
			values = [];
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, changeHandler);
		}	}}