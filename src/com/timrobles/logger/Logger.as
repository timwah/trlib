package com.timrobles.logger 
{
    /**     * @author timrobles     */    public class Logger 
    {        public static var target:ILoggerTarget = new ConsoleTarget();		public static var mode:LogMode;
		
		public static function log(msg:*):void 
        {
        	if (mode == LogMode.PRODUCTION)
        		return;
        		
            target.log(msg);
        }
        public static function info(msg:*):void
        {
        	if (mode == LogMode.PRODUCTION)
        		return;
        		
            target.log(msg, LogLevel.INFO);
        }
        public static function warn(msg:*):void
        {
        	if (mode == LogMode.PRODUCTION)
        		return;
        		
            target.log(msg, LogLevel.WARN);
        }
        public static function error(msg:*):void
        {
        	if (mode == LogMode.PRODUCTION)
        		return;
        		
            target.log(msg, LogLevel.ERROR);        }
    }}