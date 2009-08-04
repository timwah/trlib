package com.timrobles.logger 
{
    /**     * @author Tim Robles     */    public class LogMode 
    {
    	public static const PRODUCTION:LogMode = new LogMode(0);
    	public static const DEBUG:LogMode = new LogMode(1);
    	
    	public var mode:uint;
    	
    	public function LogMode(mode:uint)
    	{
            this.mode = mode;
        }    }}