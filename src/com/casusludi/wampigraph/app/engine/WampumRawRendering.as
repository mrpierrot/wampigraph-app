package com.casusludi.wampigraph.app.engine {
	import com.casusludi.wampigraph.app.assets.Assets;
	import com.casusludi.wampigraph.app.model.WampumRaw;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class WampumRawRendering extends BitmapData
	{
		private static var _faceA:BitmapData = Assets.factory.createBitmapData("PEARL_FACE_A");
		private static var _faceB:BitmapData = Assets.factory.createBitmapData("PEARL_FACE_B");
		private var _raw:WampumRaw;
		public function WampumRawRendering(pRaw:WampumRaw) 
		{
			_raw = pRaw;
			var faceWidth:int = _faceA.width > _faceB.width?_faceA.width:_faceB.width;
			var faceHeight:int = _faceA.height > _faceB.height?_faceA.height:_faceB.height;
			var w:int = faceWidth * _raw.cols;
			var h:int = faceHeight * _raw.rows;
			//super(w, h);
			super(w, h);
			var char:String;
			var face:BitmapData;
			var destPoint:Point = new Point();
			var cols:int = _raw.cols;
			for (var i:int = 0, c:int = _raw.data.length; i < c;i++ ) {
				char = _raw.data.charAt(i);
				face = char == "1"?_faceB:_faceA;
				destPoint.x = (i % cols) * faceWidth;
				destPoint.y = int(i / cols) * faceHeight;
				this.copyPixels(face, face.rect, destPoint);
			}
			
		}
	}

}