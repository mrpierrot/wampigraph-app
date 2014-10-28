package com.casusludi.wampigraph.app.net 
{
	import com.casusludi.wampigraph.app.model.Parser;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
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
		private var _backup:File;
		private var _stream:FileStream;
		
		
		public function API() 
		{
			_service = new JSONService();
			trace(File.applicationStorageDirectory.nativePath +File.separator+ 'wampums.dat');
			_backup = new File(File.applicationStorageDirectory.nativePath +File.separator+ 'wampums.dat');
			//_service.register("allWampums", "http://wampigraph.local/external/api/drawing/list-all-wampums");
			_service.register("allWampums", "http://wampigraph.net/external/api/drawing/list-all-wampums");
			_stream = new FileStream();
		}
		
		public function getAllWampums(pCallback:Function):void {
			var responder:JSONServiceResponder = _service.allWampums();
			responder.addEventListener(ServiceEvent.FAIL, function(event:ServiceEvent):void {
				cqpx_debug("no external source found");
				try {
					_stream.open(_backup, FileMode.READ);
					var result:Object = _stream.readObject();
					_stream.close();
					cqpx_debug("read local source");
					pCallback(Parser.jsonToModel(result));
				}catch (e:Error) {
					cqpx_fatal(e.getStackTrace());
				}
			});
			responder.addEventListener(ServiceEvent.SUCCESS, function(event:ServiceEvent):void {
				var result:Object =  event.result;
				if (result) {
					try {
						pCallback(Parser.jsonToModel(result));
						_stream.open(_backup, FileMode.WRITE);
						_stream.writeObject(result);
						_stream.close();
					}catch (e:Error) {
						cqpx_fatal(e.getStackTrace());
					}
				}
			});
		}
		
		static public function get instance():API 
		{
			if (_instance == null)_instance = new API;
			return _instance;
		}
		
	}

}