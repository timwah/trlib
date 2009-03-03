package com.timrobles.models.feeds 
{

	/**	 * @author Tim Robles	 */	public class FeedModel
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
		
		public function inject(items:Array):void
		{
			this.items = items;
		}

		public function getItemsByCategory(id:String):Array
		{
			var result:Array = [];
			for each (var item:FeedItem in items)
			{
				if (item.categories.indexOf(id) > -1)
					result.push(item);
			}
			return result;
		}
			}}