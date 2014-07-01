package com.davikingcode.nativeExtensions.zxing {

	import com.google.zxing.BinaryBitmap;
	import com.google.zxing.BufferedImageLuminanceSource;
	import com.google.zxing.MultiFormatReader;
	import com.google.zxing.Result;
	import com.google.zxing.common.HybridBinarizer;

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

		public function decodeFromBitmapData(bmp:BitmapData):void {

			var lsource:BufferedImageLuminanceSource = new BufferedImageLuminanceSource(bmp);
			var bitmap:BinaryBitmap = new BinaryBitmap(new HybridBinarizer(lsource));

			var res:Result = new MultiFormatReader().decode(bitmap);

			if (res)
				dispatchEvent(new ZXingEvent(ZXingEvent.SUCCESS, res.getText()));
			else
				dispatchEvent(new ZXingEvent(ZXingEvent.FAIL));
		}

	}
}