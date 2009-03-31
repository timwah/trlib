package com.timrobles.ds 
{
    import flash.utils.Dictionary;                                                /**	 * @author Tim Robles	 */	public class Tree implements Collection
	{
		//----------------------------------
		//  Constants
		//----------------------------------
		
		public static const ROOT_ID:String = "root";
		
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
			var parent:TreeNode = leaves[treeNode.parent];
			if (parent)
				parent.addChild(treeNode);
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
		
		public function contains(element:*):Boolean
        {
        	var result:Boolean = false;
        	for each (var treeNode:TreeNode in leaves)
        	{
        		if (treeNode == element)
        		{
        			result = true;
        			break;
        		}
        	}
        	return result;
        }
        
        public function isEmpty():Boolean
        {
        	var result:Boolean = true;
        	for each (var treeNode:TreeNode in leaves)
        	{
        		if (treeNode)
        		{
        			result = false;
        		}
        	}
        	return result;
        }
        
        public function clone():*
        {
        	var tree:Tree = new Tree();
        	for each (var treeNode:TreeNode in leaves)
        		tree.addNode(treeNode);
        	return tree;
        }
        
        public function get iterator():Iterator
        {
        	var elements:Array = [];
        	for each (var treeNode:TreeNode in leaves)
        		elements.push(treeNode);
        	return new ArrayIterator(elements);
        }
        
		//--------------------------------------------------------------------------
		//
		//  Protected Methods
		//
		//--------------------------------------------------------------------------
		
		protected function init():void
		{
			leaves = new Dictionary();
        }
            }}