package com.davikingcode.nativeExtensions.zxing {

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;

	public class ZXing extends EventDispatcher {

		private static var _instance:ZXing;

		public static function getInstance():ZXing {
			return _instance;
		}

		public function ZXing() {

			_instance = this;
		}

		public function init(bmp:BitmapData):void {
		}

	}
}