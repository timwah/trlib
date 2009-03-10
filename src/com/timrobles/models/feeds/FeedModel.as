package com.timrobles.models.feeds 
{
    import com.timrobles.models.feeds.dto.FeedItem;	
    /**     * @author Tim Robles	 */	public class FeedModel
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var items:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function FeedModel() 
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
			
		public function initialize(items:Array):void
		{
			this.items = items;
		}
		
		public function getItems():Array
		{
			return items;
		}

		public function getItemsByCategory(id:String):Array
		{
			var result:Array = [];
			for each (var feedItem:FeedItem in items)
			{
				if (feedItem.hasCategory(id))
					result.push(feedItem);
			}
			return result;
		}
			}}