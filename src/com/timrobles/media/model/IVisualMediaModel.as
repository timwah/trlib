package com.timrobles.media.model {    import flash.display.DisplayObject;    import flash.display.Sprite;        import com.timrobles.media.model.dto.ScaleMode;        /**     * @author Tim Robles     */    public interface IVisualMediaModel extends IMediaModel    {    	function set scaleMode(value:ScaleMode):void;    	function get scaleMode():ScaleMode;    	    	function get width():Number;        function set width(value:Number):void;                function get height():Number;        function set height(value:Number):void;                function get smoothing():Boolean;        function set smoothing(value:Boolean):void;                // you can set the video or movie        function loadClip(value:DisplayObject, autoPlay:Boolean = true):void;                // reference to the display object, how will this work for sound?        function get container():Sprite;                function get bufferLength():Number;    }}