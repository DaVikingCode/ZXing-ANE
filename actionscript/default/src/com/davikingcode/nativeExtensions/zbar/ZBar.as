package com.davikingcode.nativeExtensions.zbar {

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;

	public class ZBar extends EventDispatcher {

		private static var _instance:ZBar;

		public static function getInstance():ZBar {
			return _instance;
		}

		public function ZBar() {

			_instance = this;
		}

		public function init(bmp:BitmapData):void {
		}

	}
}