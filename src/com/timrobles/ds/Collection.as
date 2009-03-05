package com.timrobles.ds 
{
    /**     * @author Tim Robles     */    public interface Collection 
    {
        function contains(element:*):Boolean;
        function isEmpty():Boolean;
        function get iterator():Iterator;
    }
}