package com.casusludi.wampigraph.app
{
	import com.casusludi.wampigraph.app.engine.Engine;
	import com.casusludi.wampigraph.app.model.Wampum;
	import com.casusludi.wampigraph.app.net.API;
	import com.casusludi.wampigraph.app.views.EngineScreen;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import com.casusludi.wampigraph.app.views.ScreenType;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import net.croquepixel.lib.core.AbstractMain;
	import net.croquepixel.lib.display.screen.ScreenManager;
	import net.croquepixel.lib.log.DefaultLoggerSystem;
	import net.croquepixel.lib.log.out.FileLoggerOut;
	import net.croquepixel.lib.utils.MathUtils;
	
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class Main extends AbstractMain 
	{
		
		private var _engine:Engine;
		private var _screenManager:ScreenManager;
		private var _lastTime:Number;
		
		public function Main():void 
		{
			super(true);
		}
		
		override public function init():void 
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
		
			
			// initialise le gestionnaire de log par defaut
			DefaultLoggerSystem.instance.init(this);	
			// ajoute l'enregistement des logs dans des fichiers
			DefaultLoggerSystem.instance.manager.addLoggerOut(new FileLoggerOut(File.applicationStorageDirectory));

			
			// init du gestionnaire d'écran
			//_screenManager = new ScreenManager(this.stage.stageWidth, this.stage.stageHeight);
			_screenManager = new ScreenManager(1920, 1080);
			_screenManager.register(new EngineScreen());
			this.addChild(_screenManager.rendering);
			updateSize();
			
			
			_screenManager.show(ScreenType.ENGINE);
			
			_lastTime = getTimer();
			this.stage.addEventListener(Event.RESIZE, _resizeHandler);
			//this.addEventListener(Event.ENTER_FRAME, _enterFrameHandler);
			var timer:Timer = new Timer(1000 / Globals.FPS);
			timer.addEventListener(TimerEvent.TIMER, _enterFrameHandler);
			timer.start();
		}
		
		private function _enterFrameHandler(e:TimerEvent):void 
		{
			var newTime:Number = getTimer();
			var deltaTime:Number = newTime - _lastTime;
			var rate:Number = Globals.FPS * deltaTime * 0.001;
			if (_screenManager.currentScreen)_screenManager.currentScreen.update(rate);
			_lastTime = newTime;
			e.updateAfterEvent();
		}
		
		private function _resizeHandler(e:Event=null):void 
		{
			updateSize();
		}
		
		public function updateSize():void {
			/*Globals._stageWidth = this.stage.stageWidth;
			Globals._stageHeight = this.stage.stageHeight;
			var scale:Number = _screenManager.rendering.scaleX = _screenManager.rendering.scaleY = MathUtils.scaleBox(Globals.originalWidth,Globals.originalHeight,this.stage.stageWidth,this.stage.stageHeight);
			_screenManager.rendering.x = (this.stage.stageWidth - _screenManager.width*scale)*0.5;
			_screenManager.rendering.y = (this.stage.stageHeight - _screenManager.height * scale) * 0.5;
			Globals._width = _screenManager.rendering.width;
			Globals._height = _screenManager.rendering.height;
			Globals._scale = scale;
			Globals._x = _screenManager.rendering.x;
			Globals._y = _screenManager.rendering.y;*/
	
		}
		
		
	}
	
}