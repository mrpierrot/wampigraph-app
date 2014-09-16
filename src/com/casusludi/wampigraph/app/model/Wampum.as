package com.casusludi.wampigraph.app.model {
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class Wampum 
	{
		private var _id:int;
		private var _raw:WampumRaw;
		private var _user:User;
		private var _title:String;
		
		public function Wampum(pId:int,pRaw:WampumRaw,pUser:User,pTitle:String) 
		{
			_id = pId;
			_raw = pRaw;
			_user = pUser;
			_title = pTitle;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function get raw():WampumRaw 
		{
			return _raw;
		}
		
		public function get user():User 
		{
			return _user;
		}
		
		public function get title():String 
		{
			return _title;
		}
		
		public function toString():String 
		{
			return "[Wampum id=" + id + " raw=" + raw + " user=" + user + " title=" + title + "]";
		}
		
	}

}