package com.timrobles.logger 
{
	/**     * @author timrobles     */    public class Logger {    	    	public static var target:ILoggerTarget = new ConsoleTarget();    	
    	public static function log(msg:*):void 
    	{
    	   	target.log(msg);
    	}
    	
    	public static function info(msg:*):void
    	{
    		target.log(msg, LogLevel.INFO);
		}
    	
    	public static function warn(msg:*):void
    	{
    		target.log(msg, LogLevel.WARN);
    	}
    	
    	public static function error(msg:*):void
    	{
    		target.log(msg, LogLevel.ERROR);		}
		
		    	    }}