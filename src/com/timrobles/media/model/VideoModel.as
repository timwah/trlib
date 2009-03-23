package com.timrobles.media.model {    import flash.events.IOErrorEvent;    import flash.events.NetStatusEvent;    import flash.events.SecurityErrorEvent;    import flash.media.SoundTransform;    import flash.media.Video;    import flash.net.NetConnection;    import flash.net.NetStream;        import com.timrobles.logger.Logger;    import com.timrobles.media.events.MediaEvent;        /**     * @author Antti Kupila     * @author Tim Robles     */    public class VideoModel extends VisualMediaModel implements IVisualMediaModel    {    	//----------------------------------    	//  Constants    	//----------------------------------    	    	public static const DEFAULT_BUFFER:Number = 5;    	    	//----------------------------------    	//  Protected Members    	//----------------------------------    	    	protected var flushed:Boolean = false;    	protected var netStream:NetStream;    	protected var stopped:Boolean = false;    	protected var video:Video;    	    	//--------------------------------------------------------------------------    	//    	//  Constructor    	//    	//--------------------------------------------------------------------------    	    	public function VideoModel()     	{    		super();    		    		// will probably need to abstract this away for streaming video    		var netConnection:NetConnection = new NetConnection();    		netConnection.connect(null);    		    		// initialize net stream    		netStream = new NetStream(netConnection);    		// XXX: should the client be abstracted away to a generic handler?    		netStream.bufferTime = DEFAULT_BUFFER;    		netStream.client = this;    		netStream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);    		netStream.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);    		netStream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);    		            // initialize video    		video = new Video();    		video.attachNetStream(netStream);    		mediaHolder.addChild(video);    		    	}    	    	//--------------------------------------------------------------------------    	//    	//  Public Methods    	//    	//--------------------------------------------------------------------------    	        override public function load(url:String, autoPlay:Boolean = true):void        {            super.load(url, autoPlay);            _initialized = false;            flushed = false;            netStream.play(url);            dispatchEvent(new MediaEvent(MediaEvent.LOAD));        }        override public function play():void        {        	super.play();            if (_initialized)            {            	netStream.resume();            }        }        override public function pause():void        {        	super.pause();        	netStream.pause();        }                override public function close():void        {        	pause();        	_initialized = false;        	netStream.close();        	dispatchEvent(new MediaEvent(MediaEvent.CLOSE));        }                override public function get bufferTime():Number        {        	return netStream.bufferTime;        }                override public function set bufferTime(value:Number):void        {        	netStream.bufferTime;        }                override public function get volume():Number        {        	return netStream.soundTransform.volume;        }                override public function set volume(value:Number):void        {        	var soundTransform:SoundTransform = netStream.soundTransform;        	soundTransform.volume = value;        	netStream.soundTransform = soundTransform;        }                override public function get panning():Number        {        	return netStream.soundTransform.pan;        }                override public function set panning(value:Number):void        {        	netStream.soundTransform.pan = value;        }                override public function set position(value:Number):void        {        	if (!metadata)        		return;        	time = value * metadata.duration;        }                override public function get position():Number        {        	if (!metadata)        		return 0;        	return time / metadata.duration;         }                override public function set time(value:Number):void        {        	netStream.seek(Math.floor(value));        }                override public function get time():Number        {        	return netStream.time;        }                override public function get smoothing():Boolean        {        	return video.smoothing;        }                override public function set smoothing(value:Boolean):void        {        	video.smoothing = value;        }                override public function getBytesLoaded():uint        {        	return netStream.bytesLoaded;        }                override public function getBytesTotal():uint        {        	return netStream.bytesTotal;        }                //--------------------------------------------------------------------------    	//    	//  Client Handlers    	//    	//--------------------------------------------------------------------------    	    	public function onMetaData(metadata:Object):void    	{    		Logger.warn("meta data receieved: " + metadata);    		this.metadata = metadata;            updateSize();            // TODO: why is this dispatching twice?            dispatchEvent(new MediaEvent(MediaEvent.METADATA));        }    	    	public function onXMPData(xmpdata:Object):void    	{    	}    	    	//--------------------------------------------------------------------------    	//    	//  Event Handlers    	//    	//--------------------------------------------------------------------------    	    	protected function netStatusHandler(netStatusEvent:NetStatusEvent):void    	{    		if (netStatusEvent.info.level == "error")    		{    			Logger.error("Error: " + netStatusEvent.info.code + ", url: " + url);    			return;    		}    		    		switch (netStatusEvent.info.code)    		{    			case "NetStream.Play.Start":    				_initialized = true;    				stopped = false;    				if (autoPlay)    					playing = true;    				else    					pause();    				dispatchEvent(new MediaEvent(MediaEvent.READY));    				break;    			        			case "NetStream.Play.Stop":    				playing = false;    				stopped = true;    				checkEnd();    				break;    				    			case "NetStream.Seek.Notify":                    stopped = false;                    flushed = false;                    break;    				    			case "NetStream.Buffer.Flush":    				flushed = true;    				dispatchEvent(new MediaEvent(MediaEvent.BUFFER_FLUSH));                    break;    			    			case "NetStream.Buffer.Empty":    				dispatchEvent(new MediaEvent(MediaEvent.BUFFER_EMPTY));                    break;    				    			case "NetStream.Buffer.Full":    				dispatchEvent(new MediaEvent(MediaEvent.BUFFER_FULL));                    break;    					    		}    	}    	    	protected function ioErrorHandler(ioErrorEvent:IOErrorEvent):void    	{    		Logger.error("ioErrorEvent: " + ioErrorEvent.text);    		dispatchEvent(ioErrorEvent);        }                protected function securityErrorHandler(securityErrorEvent:SecurityErrorEvent):void        {        	Logger.error("securityErrorEvent: " + securityErrorEvent.text);        	dispatchEvent(securityErrorEvent);        }                //--------------------------------------------------------------------------        //        //  Protected Methods        //        //--------------------------------------------------------------------------       	       	protected function checkEnd():void       	{       		if (stopped && flushed)       		{       			dispatchEvent(new MediaEvent(MediaEvent.PLAYBACK_COMPLETE));       		}        }            }}