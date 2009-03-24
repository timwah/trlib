package com.timrobles.models.feeds.dto 
{
    import flash.utils.getQualifiedClassName;                    	
    /**     * @author Tim Robles	 */	public class MediaRSSItem 
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var _isDefault:Boolean;
		private var _url:String;
		private var _type:MediaType;
		private var _length:int;
		private var _thumbnail:MediaRSSItem;
		private var _width:Number;
		private var _height:Number;

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function MediaRSSItem(url:String, type:MediaType, length:int = 0, isDefault:Boolean = false, thumbnail:MediaRSSItem = null,
		                             width:Number = 400, height:Number = 300) 
		{
			_url = url;
			_length = length;
			_type = type;
			_isDefault = isDefault;
			_thumbnail = thumbnail;
			_width = width;
			_height = height;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function get url():String
		{
			return _url;
		}
		
		public function get type():MediaType
		{
			return _type;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		public function isDefault():Boolean
		{
			return _isDefault;
		}
		
		public function get thumbnail():MediaRSSItem
		{
			return _thumbnail;
		}
		
		public function get width():Number
		{
			return _width;
		}
		
		public function get height():Number
		{
			return _height;
		}
		
		public function toString():String
		{
			return getQualifiedClassName(this).split("::")[1] + 
				   ":\n{url: " + url +",\ntype: " + type + ",\nlength: " + length + 
				   ",\nisDefault: " + isDefault() + ",\nthumbnail: " + thumbnail + "}\n";
		}	}}