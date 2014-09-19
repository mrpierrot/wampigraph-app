package {
    import flash.display.Sprite;
    import flash.events.*;

    import flash.utils.getTimer;


    [SWF(backgroundColor='0x000000', frameRate='60', width='800', height='600')]
    public class Test extends Sprite {
	private var s:Sprite = new Sprite();
	private var s2:Sprite = new Sprite();

        public function Test() {

		

		
	    s.graphics.beginFill(0x3344ff);
	    s.graphics.drawRect(0,0,20,20);
	    s.graphics.endFill();
	    addChild(s);
			
	    s2.x = 45;
	    s2.graphics.beginFill(0xff3344);
	    s2.graphics.drawRect(0,0,20,20);
	    s2.graphics.endFill();
	    addChild(s2);
			
	    addEventListener(Event.ENTER_FRAME, update);		
        }

	private var oldTime:uint = getTimer();
	private function update(e:Event):void
	{	
	    var newTime:uint = getTimer();
	    var dt:uint = newTime - oldTime;
		
	    cqpx_debug("delta time: "+dt,30 * dt/1000);
		
	    s.x += 1;
	    s.y += 1;
		
	    s2.x += 30 * dt/1000;
	    s2.y += 30 * dt/1000;
		
	    oldTime = newTime;
	}
    }
}