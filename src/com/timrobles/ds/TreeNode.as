package com.timrobles.ds 
{
	/**	 * @author Tim Robles	 */	public class TreeNode 
	{
		//----------------------------------
		//  Private Members
		//----------------------------------
		
		private var _id:String;
		private var _data:*;
		private var _parent:String;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function TreeNode(id:String, data:*, parent:String) 
		{
			_id = id;
			_data = data;
			_parent = parent;	
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function get id():String
		{
			return _id;
		}
		
		public function get data():*
		{
			return _data;
		}
		
		public function get parent():String
		{
			return _parent;
		}
					}}