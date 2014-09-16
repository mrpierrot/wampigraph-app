package com.casusludi.wampigraph.app.model {
	/**
	 * ...
	 * @author Pierre Chabiland
	 */
	public class WampumRaw 
	{
		private var _cols:int;
		private var _rows:int;
		private var _data:String;
		
		public function WampumRaw(pCols:int,pRows:int,pData:String) 
		{
			_cols = pCols;
			_rows = pRows;
			_data = pData;
		}
		
		public function get cols():int 
		{
			return _cols;
		}
		
		public function get rows():int 
		{
			return _rows;
		}
		
		public function get data():String 
		{
			return _data;
		}
		
		public function toString():String 
		{
			return "[WampumRaw cols=" + cols + " rows=" + rows + " data=" + data + "]";
		}
		
	}

}