package com.casusludi.wampigraph.app.model 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class Parser 
	{
		
		public function Parser() 
		{
			
		}
		
		public static function jsonToModel(pJson:Object):Vector.<Wampum> {
			var ret:Vector.<Wampum> = new Vector.<Wampum>();
			var json:Array = pJson as Array;
			var users:Dictionary = new Dictionary(true);
			var wampum:Object;
			var raw:Object;
			for (var i:int = 0, c:int = json.length; i < c; i++) {
				wampum = json[i];
				raw = JSON.parse(wampum.raw);
				if (!users.hasOwnProperty(wampum.user_id)) {
					users[wampum.user_id] = new User(wampum.user_id,wampum.firstname,wampum.lastname);
				}
				ret.push(
					new Wampum(
						wampum.id,
						new WampumRaw(raw.cols, raw.rows, raw.raw),
						users[wampum.user_id],
						wampum.title
					)
				);
			}
			return ret;
		}
		
	}

}