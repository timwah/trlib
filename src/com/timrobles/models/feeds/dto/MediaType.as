package com.timrobles.models.feeds.dto 
{
    /**     * @author Tim Robles     */    public class MediaType 
    {
    	//----------------------------------
    	//  Constants
    	//----------------------------------
    	
    	public static const IMAGE:MediaType = new MediaType("image/jpeg");
    	public static const VIDEO_FLV:MediaType = new MediaType("video/x-flv");
    	
    	//----------------------------------
    	//  Public Members
    	//----------------------------------
    	
    	public var value:String = "";
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Constructor
    	//
    	//--------------------------------------------------------------------------
    	
    	public function MediaType(value:String) 
    	{
    		this.value = value;	
    	}
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Public Methods
    	//
    	//--------------------------------------------------------------------------
    	
    	public static function create(type:String):MediaType
    	{
    		var mediaType:MediaType = null;
    		switch (type)
    		{
    			case "video/x-flv":
    				mediaType = MediaType.VIDEO_FLV;
    				break;
    				
    			case "image/jpeg":
    			case "image/png":
    				mediaType = MediaType.IMAGE;
    				break;
            }
            return mediaType;
    	}
    	
    	public function toString():String
    	{
    		return "MediaType: " + value;
    	}    }}