package com.timrobles.logger
{
	import flash.external.ExternalInterface;
	import flash.system.Capabilities;
	
	public class ConsoleTarget implements ILoggerTarget
	{
		public function ConsoleTarget()
		{
		
		}
		
		public function log(msg:*, level:String = "log"):void
		{
			if (ExternalInterface.available && Capabilities.playerType == "plugIn")
				ExternalInterface.call("console.log", msg.toString ? msg.toString() : msg);
			else
				trace(msg.toString ? msg.toString() : msg);
		}	
	}
}