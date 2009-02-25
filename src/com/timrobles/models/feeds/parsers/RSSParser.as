package com.timrobles.models.feeds.parsers 
{
	import com.timrobles.models.feeds.FeedItem;											

	/**	 * @author Tim Robles	 */	public class RSSParser implements IParser 
	{		public function parse(value:XML):Array
		{
			var arr:Array = [];
			//var dcNS:Namespace = new Namespace()
			for each (var item:XML in value..item)
			{
				arr.push(new FeedItem(
					item.title.text(),
					item.description.text(),
					new Date(),
					null,
					null
				));
			}
			return arr;
		}
		
		public function getDate(value:String):Date
		{
			return value ? new Date(Date.parse(value.split("T")[0])) : null;
		}
	}}