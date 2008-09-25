package com.timrobles.logger
{
	import flash.net.LocalConnection;
	
	public class AirTarget implements ILoggerTarget
	{
		protected var connectionName:String;
		protected var lc:LocalConnection;
		
		public function AirTarget(connectionName:String = "airDebugger")
		{
			lc = new LocalConnection();
		}
		
		public function execute(msg:*, level:String = "log"):void
		{
			lc.send(connectionName, "execute", msg);
		}
		
	}
}