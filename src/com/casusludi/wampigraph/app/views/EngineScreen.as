package com.casusludi.wampigraph.app.views 
{
	import com.casusludi.wampigraph.app.engine.Engine;
	import com.casusludi.wampigraph.app.model.Wampum;
	import com.casusludi.wampigraph.app.net.API;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import net.croquepixel.lib.display.screen.IScreen;
	/**
	 * ...
	 * @author ...
	 */
	public class EngineScreen extends EventDispatcher implements IScreen
	{
		private var _engine:Engine;
		private var _rendering:DisplayObjectContainer;
		private var _timer:Timer;
		private var _width:int;
		private var _height:int;
		
		public function EngineScreen(pUpdateTime:Number=60) 
		{
			_rendering = new Sprite();
			_timer = new Timer(pUpdateTime * 1000);
			_timer.addEventListener(TimerEvent.TIMER, _timerUpdateEngineHandler);
		}
		
		private function _timerUpdateEngineHandler(e:TimerEvent):void 
		{
			//cqpx_debug("EngineScreen::[ update river ]");
			API.instance.getAllWampums(function(data:Vector.<Wampum>):void {
				_engine.setWampums(data);
			});
		}
		
		
		public function get name():String 
		{
			return ScreenType.ENGINE;
		}
		
		public function get rendering():DisplayObject 
		{
			return _rendering;
		}
		
		public function setDimension(pWidth:int, pHeight:int):void 
		{
			_width = pWidth;
			_height = pHeight;
		}
		
		public function update(rate:Number=1):void 
		{
			_engine.update(rate);
		}
		
		public function init():void 
		{	
			_engine = new Engine(_width, _height);
			_engine.rendering.y = 20;
			_rendering.addChild(_engine.rendering);
			API.instance.getAllWampums(function(data:Vector.<Wampum>):void {
				_engine.setWampums(data);
			});
		}
		
		public function onHide():void 
		{
			_timer.stop();
		}
		
		public function onHideComplete():void 
		{
			
		}
		
		public function onShow(pData:*):void 
		{
			_timer.start();
		}
		
		public function onShowComplete():void 
		{
			
		}
		
		public function get width():int 
		{
			return _width;
		}
		
		public function get height():int 
		{
			return _height;
		}
		
	}

}