package com.timrobles.util {
    import flexunit.framework.TestCase;    import flexunit.framework.TestSuite;    
    public class TestColorUtil extends TestCase {
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Constructor
    	//
    	//--------------------------------------------------------------------------
    	
        public function TestColorUtil( methodName : String = null ) {
        	
        	super( methodName );
        	
        }
        
        //--------------------------------------------------------------------------
        //
        //  Test Suite
        //
        //--------------------------------------------------------------------------

        public static function suite() : TestSuite {
        
            var ts : TestSuite = new TestSuite();
            ts.addTest( new TestColorUtil( "testColorToRGB" ) );
            return ts;
            	
        }
        
        public function testColorToRGB() : void {
        	
        	assertTrue( "Expected rgb.r = 255 for 0xFF00000.", ColorUtil.colorToRGB( 0xFF0000 ).r == 255 );
        	
        }
        
    }
    
}