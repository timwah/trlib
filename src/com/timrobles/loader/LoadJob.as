package com.timrobles.loader {    import flash.display.Loader;    import flash.events.Event;    import flash.events.EventDispatcher;    import flash.events.HTTPStatusEvent;    import flash.events.IEventDispatcher;    import flash.events.IOErrorEvent;    import flash.events.ProgressEvent;    import flash.events.SecurityErrorEvent;    import flash.net.URLLoader;    import flash.net.URLRequest;        import com.timrobles.loader.events.LoadEvent;        /**	 * @author Tim Robles	 */	public class LoadJob extends EventDispatcher implements ILoadJob 	{		//----------------------------------		//  Constants		//----------------------------------		public static const DISPLAY_FILETYPES:Array = ["swf", "gif", "png", "jpeg", "jpg"];		//----------------------------------		//  Protected Variables		//----------------------------------		protected var eventDispatcher:IEventDispatcher;		protected var loader:*;		protected var urlRequest:URLRequest;		protected var bytesLoaded:Number = 0;		protected var bytesTotal:Number = 0;		protected var filesize:Number = 0;		protected var path:String = "";		protected var _priority:int = 0;		//--------------------------------------------------------------------------		//		//  Constructor		//		//--------------------------------------------------------------------------		public function LoadJob( path:String, dataFormat:String = "text" ) 		{    					this.path = path;			var useLoader:Boolean = false;			for each ( var filetype : String in DISPLAY_FILETYPES ) 			{				if ( path.indexOf("." + filetype) > -1 ) 				{					useLoader = true;					break;				}			}    					if ( useLoader ) 			{             				loader = new Loader();				eventDispatcher = Loader(loader).contentLoaderInfo;			} 			else 			{    							loader = new URLLoader();				URLLoader(loader).dataFormat = dataFormat;				eventDispatcher = loader;			}    					urlRequest = new URLRequest(path); 		}		//--------------------------------------------------------------------------		//		//  Public Methods		//		//--------------------------------------------------------------------------		public function load():void 		{    				eventDispatcher.addEventListener(Event.COMPLETE, completeHandler);			eventDispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);			eventDispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);			eventDispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);			eventDispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);			eventDispatcher.addEventListener(Event.OPEN, openHandler);			loader.load(urlRequest);		}		public function cancel():void 		{    				eventDispatcher.removeEventListener(Event.COMPLETE, completeHandler);			eventDispatcher.removeEventListener(ProgressEvent.PROGRESS, progressHandler);			eventDispatcher.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);			eventDispatcher.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);			eventDispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);			eventDispatcher.removeEventListener(Event.OPEN, openHandler);			try 			{        				loader.close();				if ( loader is Loader )                	Loader(loader).unload();			}			catch (error:Error)			{			}		}		public function getPath():String 		{    				return path;		}		public function getBytesLoaded():Number 		{    				return bytesLoaded;		}		public function getBytesTotal():Number 		{    				return bytesTotal;		}		public function getProgress():Number 		{    				return bytesTotal != 0 ? bytesLoaded / bytesTotal : -1;		}		public function getData():* 		{    					return loader is Loader ? Loader(loader).content : URLLoader(loader).data;		}		public function getFilesize():Number 		{    					if ( bytesTotal )    			return bytesTotal;			var tmpLoader:ILoadJob = new LoadJob(path);			tmpLoader.addEventListener(ProgressEvent.PROGRESS, tmpOpenHandler);			tmpLoader.load();			return -1;		}		public function getLoadType():Class 		{    					return loader is Loader ? Loader : URLLoader;		}		public function get priority():int 		{						return _priority;		}		public function set priority( value:int ):void 		{			_priority = value;			dispatchEvent(new LoadEvent(LoadEvent.PRIORITY_CHANGE));		}		//--------------------------------------------------------------------------		//		//  Event Handlers		//		//--------------------------------------------------------------------------		protected function ioErrorHandler( ioErrorEvent:IOErrorEvent ):void 		{    				dispatchEvent(ioErrorEvent);		}		protected function progressHandler( progressEvent:ProgressEvent ):void 		{    				bytesLoaded = progressEvent.bytesLoaded;			bytesTotal = progressEvent.bytesTotal;			dispatchEvent(progressEvent);		}		protected function completeHandler( event:Event ):void 		{    				dispatchEvent(event);		}		protected function httpStatusHandler( httpStatusEvent:HTTPStatusEvent ):void 		{    				dispatchEvent(httpStatusEvent);		}		protected function securityErrorHandler( securityEvent:SecurityErrorEvent ):void 		{    					dispatchEvent(securityEvent);		}		protected function openHandler( event:Event ):void 		{    				dispatchEvent(event);		}		internal function tmpOpenHandler( event:Event ):void 		{    					var job:ILoadJob = ILoadJob(event.currentTarget);			job.removeEventListener(ProgressEvent.PROGRESS, tmpOpenHandler);			bytesTotal = job.getBytesTotal();			job.cancel();			dispatchEvent(new LoadEvent(LoadEvent.FILESIZE));		} 	}}