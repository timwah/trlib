package com.timrobles.models.feeds.dto 
{
	/**	 * @author Tim Robles	 */	public class MediaRSSItem 
	{
		private var _isDefault:Boolean;
		private var _url:String;
		private var _type:MediaType;
		private var _length:int;

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function MediaRSSItem(url:String, type:MediaType, length:int = 0, isDefault:Boolean = false) 
		{
			_url = url;
			_length = length;
			_type = type;
			_isDefault = isDefault;
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
		
		public function toString():String
		{
			return "MediaRSSItem:\n{url: " + url +",\ntype: " + type + ",\nlength: " + length + ",\nisDefault: " + isDefault() + "\n}\n";
		}	}}