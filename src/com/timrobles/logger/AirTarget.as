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
			this.connectionName = connectionName;
		}
		public function log(msg:*, level:String = "log"):void
		{
			lc.send(connectionName, "execute", msg);
		}
		
	}
}