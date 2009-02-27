package com.timrobles.models.feeds.parsers 
{
	import com.timrobles.models.feeds.FeedItem;																																																										

	/**	 * @author Tim Robles	 */	public class RSSParser implements IFeedParser 
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function RSSParser() 
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
						public function parse(value:XML):Array
		{
			var arr:Array = [];
			var dc:Namespace = value.namespace("dc");
			for each (var item:XML in value..item)
			{
				arr.push(new FeedItem(
					item.title.text(),
					item.description.text(),
					getDate(item.dc::date.text()),
					getCategories(item),
					getMedia(item)
				));
			}
			return arr;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		protected function getDate(value:String):Date
		{
			if (!value)
				return null;
			
			var formatted:String = value.split("T")[0];
			formatted = formatted.replace(/\-/g, "/");
			return new Date(Date.parse(formatted));
		}
		
		protected function getCategories(item:XML):Array
		{
			var categories:Array = [];
			for each (var category:XML in item..category)
				categories.push(category.text());
			return categories;
		}
		
		protected function getMedia(item:XML):Array
		{
			var media:Array = [];
			return media;
		}
		
	}}