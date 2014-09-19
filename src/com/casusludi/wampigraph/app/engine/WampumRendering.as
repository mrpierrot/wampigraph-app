package com.casusludi.wampigraph.app.engine 
{
	import com.casusludi.wampigraph.app.model.Wampum;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class WampumRendering extends Sprite
	{
		
		private var _data:Wampum;
		private var _rawRendering:WampumRawRendering;
		public var alive:Boolean;
		public var posX:Number = 0;
		
		public function WampumRendering(pWampum:Wampum) 
		{
			_data = pWampum;
			_rawRendering = new WampumRawRendering(pWampum.raw);
			
			var bitmap:Bitmap = new Bitmap(_rawRendering);
			this.addChild(bitmap);
			
			alive = true;
		}
		
	}

}