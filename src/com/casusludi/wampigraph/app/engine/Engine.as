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
		private var _stock:Vector.<Wampum>;
		private var _waitingElements:Vector.<Wampum>;
		private var _stockIndex:int;
		private var _renderingList:Vector.<WampumRendering>;
		private var _speedXPerUpdate:Number;
		private var _width:int;
		private var _height:int;
		private var _padding:int = 0;
		
		public function Engine(pWidth:int,pHeight:int) 
		{
			_width = pWidth;
			_height = pHeight;
			_speedXPerUpdate = 0.5;
			_rendering = new Sprite();
			_renderingList = new Vector.<WampumRendering>();
			_stock = new Vector.<Wampum>();
			_waitingElements = new Vector.<Wampum>();
			_stockIndex = 0;
		}
		
		public function setWampums(pWampums:Vector.<Wampum>):void {
			_waitingElements.splice(0, int.MAX_VALUE);
			for (var i:int = 0, c:int = pWampums.length; i < c; i++) {
				try{
				_waitingElements.push(pWampums[i]);
				}catch (e:Error) {
					//cqpx_fatal("error on this wampum : "+pWampums[i]);
					//cqpx_fatal(e.getStackTrace());
				}
			}
		}
		
		public function get rendering():DisplayObjectContainer 
		{
			return _rendering;
		}
		
		public function update(rate:Number=1):void {
			var item:WampumRendering;
			var i:int, c:int;
			var speed:Number = _speedXPerUpdate * rate;
			for (i = 0, c = _renderingList.length; i < c; i++) {
				item = _renderingList[i];
				item.alive = item.x + item.width > 0;
				if (item.alive) {
					item.posX -= speed;
					item.x = int(item.posX + 0.5);
					
				}else {
					
					_rendering.removeChild(item);
					_renderingList.splice(i, 1);
					c = _renderingList.length;
					item._rawRendering.dispose();
				}
			}
			
			if (c > 0) {
				item = _renderingList[c - 1];
				if (item.x + item.width < _width + 100) {
					var newItem:WampumRendering = _createItem();
					if(newItem)newItem.posX = newItem.x = item.x + item.width+_padding;
				}
			}else {
				_createItem();
			}
			
		}
		
		public function _createItem():WampumRendering {
			var newItem:WampumRendering;
			var stockSize:int = _stock.length;
			// si on arrive au bout du stock de wampum à afficher et qu'il y a eu une mise à jour des wampums disponibles
			if (stockSize <= _stockIndex + 1 && _waitingElements.length > 0 ) {
				// alors on remplace le stock actuel par la mise à jour
				_stock = _waitingElements.concat();
				stockSize = _stock.length;
				_stockIndex = 0;
			}else {
				// sinon on recupere le wampum suivant dans le stock
				_stockIndex = (_stockIndex + 1) % stockSize;
			}
			// si le stock n'est pas vide
			if (stockSize > 0) {
				// alors on ajoute le wampum courant dans la riviere
				newItem = new WampumRendering(_stock[_stockIndex]);
				_renderingList.push(newItem);
				_rendering.addChild(newItem);
			}
			return newItem;
		}
	}
}