package com.casusludi.wampigraph.app.net 
{
	import com.casusludi.wampigraph.app.model.Parser;
	import net.croquepixel.lib.events.ServiceEvent;
	import net.croquepixel.lib.net.services.JSONService;
	import net.croquepixel.lib.net.services.JSONServiceResponder;
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class API 
	{
		
		private static var _instance:API;
		private var _service:JSONService;
		
		
		public function API() 
		{
			_service = new JSONService();
			_service.register("allWampums", "http://wampigraph.local/external/api/drawing/list-all-wampums");
		}
		
		public function getAllWampums(pCallback:Function):void {
			var responder:JSONServiceResponder = _service.allWampums();
			responder.addEventListener(ServiceEvent.FAIL, _errorHandler);
			responder.addEventListener(ServiceEvent.SUCCESS, function(event:ServiceEvent):void {
				pCallback(Parser.jsonToModel(event.result));
			});
		}
		
		private function _errorHandler(event:ServiceEvent):void {
			
		}
		
		static public function get instance():API 
		{
			if (_instance == null)_instance = new API;
			return _instance;
		}
		
	}

}