package com.davikingcode.nativeExtensions.zbar {

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class ZBar extends EventDispatcher {

		private static var _instance:ZBar;

		public var extensionContext:ExtensionContext;

		public static function getInstance():ZBar {
			return _instance;
		}

		public function ZBar() {

			_instance = this;

			extensionContext = ExtensionContext.createExtensionContext("com.davikingcode.nativeExtensions.ZBar", null);

			if (!extensionContext)
				throw new Error( "ZBar native extension is not supported on this platform." );

			extensionContext.addEventListener(StatusEvent.STATUS, _onStatus);
		}

		private function _onStatus(sEvt:StatusEvent):void {

			switch (sEvt.code) {

				case ZBarEvent.SUCCESS:
					dispatchEvent(new ZBarEvent(ZBarEvent.SUCCESS, sEvt.level));	
					break;

				case ZBarEvent.FAIL:
					dispatchEvent(new ZBarEvent(ZBarEvent.FAIL));	
					break;
			}

		}

		public function init(bmp:BitmapData):void {
			extensionContext.call("init", bmp);
		}

	}
}