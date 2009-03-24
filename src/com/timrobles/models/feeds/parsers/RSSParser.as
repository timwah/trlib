package com.timrobles.models.feeds.parsers 
{
    import com.timrobles.models.feeds.dto.FeedItem;
    import com.timrobles.models.feeds.dto.MediaRSSItem;
    import com.timrobles.models.feeds.dto.MediaType;    

    /**	 * @author Tim Robles	 */	public class RSSParser implements IFeedParser 
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var media:Namespace;
		
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
			media = value.namespace("media");
			for each (var item:XML in value..item)
			{
				arr.push(new FeedItem(
					item.title.text(),
					item.description.text(),
					getDate(item.dc::date.text()),
					getCategories(item),
					getMedia(item),
					getThumbnail(item)
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
			var result:Array = [];
			for each (var mediaItem:XML in item.media::content)
			{
				result.push(createMediaRSSItem(mediaItem));
			}
			return result;
		}
		
		protected function getThumbnail(item:XML):MediaRSSItem
		{
			var mediaXML:XML = item.media::thumbnail[0];
			var thumbnail:MediaRSSItem = null;
			if (mediaXML)
			{
				thumbnail = createMediaRSSItem(mediaXML);
			}
			return thumbnail;
		}
		
		protected function createMediaRSSItem(mediaItem:XML):MediaRSSItem
		{
			return new MediaRSSItem(mediaItem.@url, 
									MediaType.create(mediaItem.@type), 0, 
									String(mediaItem.@isDefault) == "true" ? true : false,
									mediaItem.media::thumbnail[0] ? createMediaRSSItem(mediaItem.media::thumbnail[0]) : null,
									parseFloat(mediaItem.@width), parseFloat(mediaItem.@height)); 
		}
		
	}}