package com.timrobles.logger 
{

	/**	 * @author Tim Robles	 */	public class LogLevel 
	{
		public static const LOG:LogLevel = new LogLevel("log");
		public static const INFO:LogLevel = new LogLevel("info");
		public static const WARN:LogLevel = new LogLevel("warn");
		public static const ERROR:LogLevel = new LogLevel("error");	
		public var value:String = "";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function LogLevel(value:String) 
		{
			this.value = value;	
		}	}}