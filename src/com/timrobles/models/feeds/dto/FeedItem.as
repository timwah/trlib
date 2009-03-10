package com.timrobles.models.feeds.dto 
{
    import com.timrobles.logger.Logger;	        /**     * @author Tim Robles	 */	public class FeedItem 
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var _title:String;
		private var _description:String;
		private var _date:Date;
		private var _categories:Array;
		private var _media:Array;
		private var _thumbnail:MediaRSSItem;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function FeedItem(title:String, description:String, date:Date, categories:Array, media:Array,
								 thumbnail:MediaRSSItem = null) 
		{
			_title = title;
			_description = description;
			_date = date;
			_categories = categories;
			_media = media;
			_thumbnail = thumbnail;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------				public function get title():String		{
			return _title;		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function get date():Date
		{
			return _date;
		}
		
		public function get categories():Array
		{
			return _categories;
		}
		
		public function get media():Array
		{
			return _media;
		}
		
		public function get thumbnail():MediaRSSItem
		{
			return _thumbnail;
		}
		
		public function hasCategory(id:String):Boolean
		{
			var result:Boolean = false;
			for each (var category:String in _categories)
			{
				if (category == id)
				{
					result = true;
					break;
				}
			}
			return result;
		}	}}