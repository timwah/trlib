package com.timrobles.media {    import flash.display.DisplayObject;    import flash.display.Sprite;    import flash.events.Event;        import com.timrobles.media.model.IVisualMediaModel;    import com.timrobles.media.model.dto.ScaleMode;        /**     * @author Tim Robles     */    public class VisualMediaController extends MediaController implements IVisualMediaController     {    	//--------------------------------------------------------------------------    	//    	//  Constructor    	//    	//--------------------------------------------------------------------------    	    	public function VisualMediaController(mediaModel:IVisualMediaModel)     	{    		super(mediaModel);    		model.addEventListener(Event.RESIZE, eventHandler);        }                //--------------------------------------------------------------------------        //        //  Public Methods        //        //--------------------------------------------------------------------------                public function get scaleMode():ScaleMode        {        	return model.scaleMode;        }                public function get width():Number        {        	return model.width;        }                public function get height():Number        {        	return model.height;        }                public function get smoothing():Boolean        {        	return model.smoothing;        }                public function get container():Sprite        {        	return model.container;        }                public function set scaleMode(value:ScaleMode):void        {        	model.scaleMode = value;        }                public function set width(value:Number):void        {        	model.width = value;        }                public function set height(value:Number):void        {        	model.height = value;        }                public function set smoothing(value:Boolean):void        {        	model.smoothing = value;        }                public function loadClip(value:DisplayObject, autoPlay:Boolean = true):void        {        	model.loadClip(value, autoPlay);        }                //--------------------------------------------------------------------------        //        //  Event Handlers        //        //--------------------------------------------------------------------------                protected function eventHandler(event:Event):void        {        	dispatchEvent(event);        }                //--------------------------------------------------------------------------        //        //  Protected Methods        //        //--------------------------------------------------------------------------                protected function get model():IVisualMediaModel        {        	return IVisualMediaModel(mediaModel);        }                    }}