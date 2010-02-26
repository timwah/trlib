package com.timrobles.util 
{
    import org.flexunit.asserts.assertTrue;

    public class TestColorUtil 
    {
        //--------------------------------------------------------------------------
        //
        //  Test Cases
        //
        //--------------------------------------------------------------------------
		
		[Test]
        public function testColorToRGB():void 
        {
            assertTrue("Expected rgb.r = 255 for 0xFF00000.", ColorUtil.colorToRGB(0xFF0000).r == 255);
        }
    }
}