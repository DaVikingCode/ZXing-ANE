package com.davikingcode.nativeExtensions.zxing {

	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class ZXing extends EventDispatcher {

		private static var _instance:ZXing;

		public var extensionContext:ExtensionContext;

		public static function getInstance():ZXing {
			return _instance;
		}

		public function ZXing() {

			_instance = this;

			extensionContext = ExtensionContext.createExtensionContext("com.davikingcode.nativeExtensions.ZXing", null);

			if (!extensionContext)
				throw new Error( "ZXing native extension is not supported on this platform." );

			extensionContext.addEventListener(StatusEvent.STATUS, _onStatus);
		}

		private function _onStatus(sEvt:StatusEvent):void {

			switch (sEvt.code) {

				case ZXingEvent.SUCCESS:
					dispatchEvent(new ZXingEvent(ZXingEvent.SUCCESS, sEvt.level));	
					break;

				case ZXingEvent.FAIL:
					dispatchEvent(new ZXingEvent(ZXingEvent.FAIL));	
					break;
			}

		}

		public function decodeFromBitmapData(bmp:BitmapData):void {
			extensionContext.call("decodeFromBitmapData", bmp);
		}

	}
}