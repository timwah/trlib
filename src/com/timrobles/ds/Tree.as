package com.timrobles.ds 
{
	import flash.utils.Dictionary;																				

	/**	 * @author Tim Robles	 */	public class Tree 
	{
		//----------------------------------
		//  Protected Members
		//----------------------------------
		
		protected var leaves:Dictionary;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Tree() 
		{
			init();	
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function addNode(treeNode:TreeNode):void
		{
			leaves[treeNode.id] = treeNode;
		}
		
		public function getNode(id:String):TreeNode
		{
			return leaves[id];
		}
		
		public function getDescendantsByID(id:String):Array
		{
			var result:Array = [];
			for each (var node:TreeNode in leaves)
			{
				if (node.parent == id)
					result.push(node);
			}
			return result;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		protected function init():void
		{
			leaves = new Dictionary();
		}	}}