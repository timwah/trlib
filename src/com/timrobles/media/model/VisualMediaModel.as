package com.timrobles.media.model {    import flash.display.DisplayObject;    import flash.display.Sprite;    import flash.events.Event;    import flash.geom.Rectangle;        import com.timrobles.media.model.dto.ScaleMode;    import com.timrobles.util.ResizeUtil;        /**     * <p>Base class for visual media like videos (flv, h264) or swfs.     * Implementation of the actual loading and controls is left to subclasses.</p>     *      * @author Antti Kupila     * @author Tim Robles     */    public class VisualMediaModel extends MediaModel implements IVisualMediaModel    {    	//----------------------------------    	//  Events    	//----------------------------------    	    	[Event(name="resize", type="flash.events.Event")]    	    	//----------------------------------    	//  Protected Members    	//----------------------------------    	    	protected var mediaHolder:Sprite;    	protected var mediaContainer:Sprite;    	protected var _height:Number;    	protected var _scaleMode:ScaleMode = ScaleMode.STRETCH;    	protected var _width:Number;    	    	//--------------------------------------------------------------------------    	//    	//  Constructor    	//    	//--------------------------------------------------------------------------    	    	public function VisualMediaModel()     	{    		super();    		mediaHolder = new Sprite();    		mediaContainer = new Sprite();    		mediaContainer.addChild(mediaHolder);    		_width = container.width;    		_height = container.height;    	}    	    	//--------------------------------------------------------------------------    	//    	//  Public Methods    	//    	//--------------------------------------------------------------------------    	    	public function get width():Number    	{    		return _width * container.scaleX;    	}    	    	public function get height():Number    	{    		return _height * container.scaleY;    	}    	        public function set width(value:Number):void        {        	switch (_scaleMode)        	{        		case ScaleMode.FILL:        		case ScaleMode.FIT:        			_width = value;        			updateSize();        			break;        		        		case ScaleMode.STRETCH:        		default:        			mediaHolder.width = value;        			break;        	}        }                public function set height(value:Number):void        {        	switch (_scaleMode)        	{        		case ScaleMode.FILL:        		case ScaleMode.FIT:        			_height = value;        			updateSize();        			break;        			        		case ScaleMode.STRETCH:        		default:        			mediaHolder.height = value;        			break;        	}        }                public function get scaleMode():ScaleMode        {        	return _scaleMode;        }                public function set scaleMode(value:ScaleMode):void        {        	_scaleMode = value;        }                public function loadClip(value:DisplayObject, autoPlay:Boolean = true):void        {        	this.autoPlay = autoPlay;        	// you can set a movie asset here to control dynamically.        	// not sure how this will work for flash.media.Video        }                public function get container():Sprite        {        	return mediaContainer;        }                /**         * Override and implement.         */        public function get smoothing():Boolean        {        	return false;        }                /**         * Override and implement.         */        public function set smoothing(value:Boolean):void        {        	        }                //--------------------------------------------------------------------------        //        //  Protected Methods        //        //--------------------------------------------------------------------------                protected function updateSize():void        {        	if (isNaN(_width))        		_width = mediaHolder.width;        	if (isNaN(_height))        		_height = mediaHolder.height;        	        	if (!_width || !_height)        		return;        	        	var size:Object = metadata || {width: _width, height: _height};        	var rect:Rectangle;        	switch (_scaleMode)        	{        		case ScaleMode.FILL:        			rect = ResizeUtil.getFillRect(size.width, size.height, _width, _height);        			break;        		        		case ScaleMode.FIT:        			rect = ResizeUtil.getFitRect(size.width, size.height, _width, _height);        			break;        	}        	mediaHolder.width = rect.width;        	mediaHolder.height = rect.height;        	mediaHolder.x = rect.x;        	mediaHolder.y = rect.y;        	dispatchEvent(new Event(Event.RESIZE));        	mediaContainer.scrollRect = new Rectangle(0, 0, _width, _height);         }    }}