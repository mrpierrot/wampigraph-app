package com.casusludi.wampigraph.app.model {
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class User 
	{
		private var _id:int;
		private var _firstname:String;
		private var _lastname:String;
		
		public function User(pId:int,pFistname:String,pLastname:String) 
		{
			_id = pId;
			_firstname = pFistname;
			_lastname = pLastname;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function get firstname():String 
		{
			return _firstname;
		}
		
		public function get lastname():String 
		{
			return _lastname;
		}
		
		public function toString():String 
		{
			return "[User id=" + id + " firstname=" + firstname + " lastname=" + lastname + "]";
		}
		
	}

}