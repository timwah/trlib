package com.timrobles.models.navigation 
{
    import flash.events.IEventDispatcher;    	    /**     * @author Tim Robles	 */	public interface INavigationProxy extends IEventDispatcher 
	{
		function setValue(value:String):void;
		function setValues(values:Array):void;
		function getValue():String;
		function getValues():Array;	}}