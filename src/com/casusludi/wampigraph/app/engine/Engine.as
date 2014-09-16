package com.casusludi.wampigraph.app.engine {
	import com.casusludi.wampigraph.app.model.Wampum;
	import com.casusludi.wampigraph.app.net.API;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class Engine 
	{
		private var _rendering:DisplayObjectContainer;
		private var _stock:Vector.<WampumRendering>;
		private var _stockIndex:int;
		private var _renderingList:Vector.<WampumRendering>;
		private var _speedXPerUpdate:int;
		private var _width:int;
		private var _height:int;
		
		public function Engine(pWidth:int,pHeight:int) 
		{
			_width = pWidth;
			_height = pHeight;
			_speedXPerUpdate = 2;
			_rendering = new Sprite();
			_renderingList = new Vector.<WampumRendering>();
			_stock = new Vector.<WampumRendering>();
		}
		
		public function setWampums(pWampums:Vector.<Wampum>):void {
			_renderingList.splice(0, int.MAX_VALUE);
			_stock.splice(0, int.MAX_VALUE);
			for (var i:int = 0, c:int = pWampums.length; i < c; i++) {
				_stock.push(new WampumRendering(pWampums[i]));
			}
			_stockIndex = 0;
			_renderingList.push(_stock[0]);
			_rendering.addChild(_renderingList[0]);
		}
		
		public function get rendering():DisplayObjectContainer 
		{
			return _rendering;
		}
		
		public function update():void {
			var item:WampumRendering;
			var i:int, c:int;
			for (i = 0, c = _renderingList.length; i < c; i++) {
				item = _renderingList[i];
				item.alive = item.x + item.width > 0;
				if (item.alive) {
					item.x -= _speedXPerUpdate;
				}else {
					_rendering.removeChild(item);
					_renderingList.splice(i, 1);
					c = _renderingList.length;
				}
			}
			if (c > 0) {
				item = _renderingList[c - 1];
				if (item.x+item.width<_width+100) {
					_stockIndex = (_stockIndex + 1) % _stock.length;
					var newItem:WampumRendering = _stock[_stockIndex];
					newItem.x = item.x + item.width;
					_renderingList.push(newItem);
					_rendering.addChild(newItem);
				}
			}
			

			
		}
	}
}