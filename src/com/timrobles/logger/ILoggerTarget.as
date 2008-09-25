package com.timrobles.logger
{
	public interface ILoggerTarget
	{
		function log(msg:*, level:String = "info");	
	}
}