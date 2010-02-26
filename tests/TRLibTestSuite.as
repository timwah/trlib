package  
{
    import com.timrobles.ds.TestArrayIterator;
    import com.timrobles.ds.TestHeap;
    import com.timrobles.loader.TestLoadJob;
    import com.timrobles.models.feeds.parsers.TestRSSParser;
    import com.timrobles.util.TestColorUtil;
    import com.timrobles.util.TestFontUtil;

    /**
     * @author tim.robles
     */
    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class TRLibTestSuite 
    {
    	// com.timrobles.ds
    	public var testArrayIterator:TestArrayIterator;
    	public var testHeap:TestHeap;
    	
    	// com.timrobles.loader
    	public var testLoadJob:TestLoadJob;
    	
    	// com.timrobles.models.feeds.parsers
    	public var testRssParser:TestRSSParser;
    	
    	// com.timrobles.util
		public var testColorUtil:TestColorUtil;    	
    	public var testFontUtil:TestFontUtil;
    }
}
