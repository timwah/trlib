package com.timrobles.models.navigation 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import com.graphikboutique.model.IContentModel;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;	

	/**	 * @author Tim Robles	 */	public class SWFAddressProxy extends EventDispatcher implements INavigationProxy
	{
		//----------------------------------
		//  Constants
		//----------------------------------
		
		public static const SEPARATOR:String = "/";
		
		//----------------------------------
		//  Protected Members
		//----------------------------------

		protected var contentModel:IContentModel;		
		protected var values:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function SWFAddressProxy(contentModel:IContentModel = null) 
		{
			this.contentModel = contentModel;
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
			if (contentModel)
			{
				SWFAddress.setTitle(contentModel.getTitle(value, SEPARATOR));
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