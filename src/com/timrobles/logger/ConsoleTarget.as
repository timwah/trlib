package com.timrobles.logger
{
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;	

	public class ConsoleTarget implements ILoggerTarget
	{
		public function ConsoleTarget()
		{
		
		}
		
		public function log(msg:*, level:LogLevel = null):void
		{
			if (ExternalInterface.available && Capabilities.playerType.toLowerCase() == "plugin")
			{
				var fn:String = "";
				switch (level)
				{
					case LogLevel.ERROR:
						fn = "console.error";
						break;
					
					case LogLevel.WARN:
						fn = "console.warn";
						break;
					
					case LogLevel.INFO:
						fn = "console.info";
						break;
						
					case LogLevel.LOG:
					default:
						fn = "console.log";
						break;
				}
				ExternalInterface.call(fn, msg.toString ? msg.toString() : msg);
			}
			else
				trace(msg.toString ? msg.toString() : msg);
		}	
	}
}