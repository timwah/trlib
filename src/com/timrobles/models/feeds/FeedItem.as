package com.timrobles.models.feeds 
{
	/**	 * @author Tim Robles	 */	public class FeedItem 
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var _title:String;
		private var _description:String;
		private var _date:Date;
		private var _categories:Array;
		private var _media:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function FeedItem(title:String, description:String, date:Date, categories:Array, media:Array) 
		{
			_title = title;
			_description = description;
			_date = date;
			_categories = categories;
			_media = media;
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
		}	}}