package com.timrobles.models.feeds 
{
	/**	 * @author Tim Robles	 */	public class MediaItem 
	{
		private var _url:String;
		private var _type:String;
		private var _length:int;

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function MediaItem(url:String, type:String, length:int = 0) 
		{
			_url = url;
			_length = length;
			_type = type;
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
		
		public function get type():String
		{
			return _type;
		}
		
		public function get length():int
		{
			return _length;
		}	}}