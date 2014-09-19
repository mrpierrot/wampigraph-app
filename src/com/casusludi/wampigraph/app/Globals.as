package com.casusludi.wampigraph.app
{

	import flash.filesystem.File;
	import net.croquepixel.lib.display.ui.standby.StandByManager;
	import net.croquepixel.lib.utils.Properties;
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class Globals 
	{
	
		public static var _width:int;
		public static var _height:int;
		private static var _originalWidth:int = 1920;
		private static var _originalHeight:int = 1080;
		public static var _stageWidth:int = 1920;
		public static var _stageHeight:int = 1080;
		public static var _scale:Number;
		public static var _x:Number;
		public static var _y:Number;
		public static var _stanbByManager:StandByManager;
		public static var main:Main;
		public static var FPS:int = 60;
		
		
		public function Globals() 
		{
			
		}
		
		
		static public function get stanbByManager():StandByManager 
		{
			return _stanbByManager;
		}
		
		static public function get width():int 
		{
			return _width;
		}
		
		static public function get height():int 
		{
			return _height;
		}
		
		static public function get scale():Number 
		{
			return _scale;
		}
		
		static public function get x():Number 
		{
			return _x;
		}
		
		static public function get y():Number 
		{
			return _y;
		}
		
		static public function get originalWidth():int 
		{
			return _originalWidth;
		}
		
		static public function get originalHeight():int 
		{
			return _originalHeight;
		}
		
		
		static public function get stageWidth():int 
		{
			return _stageWidth;
		}
		
		static public function get stageHeight():int 
		{
			return _stageHeight;
		}
		
	}

}