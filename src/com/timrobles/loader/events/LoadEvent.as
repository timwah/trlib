package com.timrobles.loader.events {	import flash.events.Event;					/**	 * @author timrobles	 */	public class LoadEvent extends Event {				//----------------------------------		//  Constants		//----------------------------------				public static const FILESIZE : String = "filesize";		public static const PRIORITY_CHANGE : String = "priorityChange";				//--------------------------------------------------------------------------		//		//  Constructor		//		//--------------------------------------------------------------------------				public function LoadEvent( type : String, bubbles : Boolean = false, cancelable : Boolean = false ) {						super( type, bubbles, cancelable );					}			}	}