package com.timrobles.interfaces {    import flash.events.IEventDispatcher;                /**     * @author Tim Robles     */    public interface IDestroyable extends IEventDispatcher     {    	function deconstruct():void;    }}