package com.casusludi.wampigraph.app.engine 
{
	import com.casusludi.wampigraph.app.model.Wampum;
	import fl.text.TLFTextField;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import net.croquepixel.lib.utils.TextFactory;
	/**
	 * ...
	 * @author ...
	 */
	public class WampumRendering extends Sprite
	{
		
		public var _data:Wampum;
		internal var _rawRendering:WampumRawRendering;
		private var _label:TLFTextField;
		public var alive:Boolean;
		public var posX:Number = 0;
		
		public function WampumRendering(pWampum:Wampum) 
		{
			_data = pWampum;
			_rawRendering = new WampumRawRendering(pWampum.raw);
				
			var bitmap:Bitmap = new Bitmap(_rawRendering);
			this.addChild(bitmap);
			
			var triangle:Shape = new Shape();
			var g:Graphics = triangle.graphics;
			g.beginFill(0xFFFFFF);
			g.moveTo(14, 0);
			g.lineTo(28, 28);
			g.lineTo(0, 28);
			g.lineTo(14, 0);
			this.addChild(triangle);
			triangle.x = -14;
			triangle.y = bitmap.height + 15;
			var message:String = "<i>"+pWampum.title+ "</i>  -  " + pWampum.user.firstname+" " + pWampum.user.lastname;
			_label = TextFactory.createText(message, _rawRendering.width, 28, 0xFFFFFF, "Bebas Neue", "left");
			_label.embedFonts = false;
			_label.x = triangle.x + triangle.width + 20;
			_label.y = bitmap.height + 15;
			this.addChild(_label);
			
			alive = true;
		}
		
		override public function get width():Number 
		{
			return super.width-14;
		}
		
		override public function set width(value:Number):void 
		{
			super.width = value;
		}
		
	}

}