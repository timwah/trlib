package com.timrobles.net.services {    import flash.events.Event;    import flash.events.EventDispatcher;    import flash.net.URLLoader;    import flash.net.URLRequest;    import flash.net.URLRequestMethod;    import flash.net.URLVariables;        import com.timrobles.common.events.SuccessEvent;    import com.timrobles.interfaces.IDestroyable;        /**     * @author Tim Robles     */    public class SimpleService extends EventDispatcher implements IDestroyable    {    	//----------------------------------    	//  Protected Members    	//----------------------------------    	    	protected var data:*;    	protected var serviceURL:String;    	protected var urlLoader:URLLoader;    	protected var urlRequest:URLRequest;    	    	//--------------------------------------------------------------------------    	//    	//  Constructor    	//    	//--------------------------------------------------------------------------    	    	public function SimpleService(serviceURL:String)     	{            this.serviceURL = serviceURL;            init();	    	}    	    	//--------------------------------------------------------------------------    	//    	//  Public Methods    	//    	//--------------------------------------------------------------------------    	    	public function invoke(parameters:Object = null, method:String = null):void    	{    		if (parameters)    		{    			var urlVariables:URLVariables = new URLVariables();    			for (var key:String in parameters)                    urlVariables[key] = parameters[key];    			urlRequest.data = urlVariables;    		}    		else    		{         			urlRequest.data = null;	    		}    		    		urlRequest.method = method ? method : URLRequestMethod.GET;            urlLoader.load(urlRequest);    	}    	    	public function getData():*    	{    		return data;    	}    	    	public function deconstruct():void        {        	data = null;        	serviceURL = null;        	urlLoader.removeEventListener(Event.COMPLETE, completeHandler);        	urlLoader = null;        	dispatchEvent(new SuccessEvent(SuccessEvent.SUCCESS));        }    	    	//--------------------------------------------------------------------------    	//    	//  Event Handlers    	//    	//--------------------------------------------------------------------------    	    	protected function completeHandler(event:Event):void    	{    		dispatchEvent(new SuccessEvent(SuccessEvent.SUCCESS));        }    	    	//--------------------------------------------------------------------------    	//    	//  Protected Methods    	//    	//--------------------------------------------------------------------------    	    	protected function init():void    	{    		urlLoader = new URLLoader();    		urlRequest = new URLRequest(serviceURL);    		urlLoader.addEventListener(Event.COMPLETE, completeHandler);        }    }}