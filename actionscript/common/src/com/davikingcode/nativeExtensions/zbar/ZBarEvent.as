package com.davikingcode.nativeExtensions.zbar {

	import flash.events.Event;

	public class ZBarEvent extends Event {

		static public const SUCCESS:String = "SUCCESS";
		static public const FAIL:String = "FAIL";

		private var _url:String;

		public function ZBarEvent( type : String, url:String = "", bubbles : Boolean = false, cancelable : Boolean = false )
		{
			super( type, bubbles, cancelable );

			_url = url;
		}

		public function get url():String {

			return _url;
		}
	}
}
