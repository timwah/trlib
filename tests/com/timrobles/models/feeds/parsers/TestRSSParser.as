package com.timrobles.models.feeds.parsers {    import com.timrobles.models.feeds.dto.FeedItem;    import org.flexunit.asserts.assertEquals;    import org.flexunit.asserts.assertNotNull;    import org.flexunit.asserts.assertTrue;    /**	 * @author Tim Robles	 */	public class TestRSSParser	{		//----------------------------------		//  Private Members		//----------------------------------				private var parser:IFeedParser;				//--------------------------------------------------------------------------		//		//  Scaffold		//		//--------------------------------------------------------------------------				[Before]		public function setUp():void		{			parser = new RSSParser();		}				[After]		public function tearDown():void		{			parser = null;		}				//--------------------------------------------------------------------------		//		//  Test Cases		//		//--------------------------------------------------------------------------				[Test]		public function testInstantiation():void		{			assertEquals(parser is IFeedParser, true);		}				[Ignore("invalide namespace error?")]		[Test]		public function testParse():void		{			var testXML:XML =			<channel xmlns:dc="http://purl.org/dc/elements/1.1/">			<item>            <title>Motion 1</title>            <link>http://www.w3schools.com/rss</link>            <description><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut hendrerit lorem sed augue. Proin imperdiet cursus purus. Vestibulum feugiat erat eget dui. Pellentesque malesuada lectus sed massa. Integer in sem. Praesent lacus. Fusce et leo a dui sagittis vestibulum. Vestibulum non sem. Morbi feugiat elit quis diam. In nisl nunc, pretium at, interdum eget, lacinia venenatis, erat. Proin in ipsum. Vestibulum a nisi sed eros tincidunt tempus. Proin eget libero a ipsum venenatis bibendum. Maecenas hendrerit nisl sit amet ligula. In pharetra, dui eu auctor congue, neque lacus adipiscing nibh, ac porta enim arcu eu felis. ]]></description>            <enclosure url="http://www.w3schools.com/media/3d.wmv" length="78645" type="video/wmv"/>            <category>motion</category>            <category>news</category>            <dc:date>2009-01-27T08:52:02-08:00</dc:date>                    	</item></channel>;        	var values:Array = parser.parse(testXML);        	assertTrue(values[0] is FeedItem);        	var feedItem:FeedItem = values[0];        	assertEquals("Motion 1", feedItem.title);        	assertNotNull(feedItem.description);        	assertTrue(feedItem.description.indexOf("Lorem ipsum dolor") == 0);        	assertEquals(2, feedItem.categories.length);        	assertEquals("motion", feedItem.categories[0]);        	assertNotNull(feedItem.date);        	assertEquals(0, feedItem.date.month);			assertEquals(27, feedItem.date.date);			assertEquals(2009, feedItem.date.fullYear);		}	}}