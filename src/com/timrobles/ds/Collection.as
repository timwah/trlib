package com.timrobles.ds {
        /**     * @author timrobles     */    public interface Collection {
    	
    	function contains( element : * ) : Boolean;
    	function isEmpty() : Boolean;
    	function get iterator() : Iterator;
    	    }
    }