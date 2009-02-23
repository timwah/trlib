package com.timrobles.logger
{
	public interface ILoggerTarget
	{
		function log(msg:*, level:LogLevel = null):void;	
	}
}