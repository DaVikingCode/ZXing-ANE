package {

	import com.davikingcode.nativeExtensions.zxing.ZXing;
	import com.davikingcode.nativeExtensions.zxing.ZXingEvent;

	import flash.display.Sprite;

	[SWF(width='320', height='480', frameRate='30', backgroundColor='#000000')]

	public class ZXingTest extends Sprite {
		
		[Embed(source="/../../embed/qrcode.jpg")]
		private const qrCodeBitmap:Class;

		public function ZXingTest() {
			
			var zxing:ZXing = new ZXing();
			zxing.addEventListener(ZXingEvent.FAIL, _zxingEvt);
			zxing.addEventListener(ZXingEvent.SUCCESS, _zxingEvt);
			
			zxing.decodeFromBitmapData(new qrCodeBitmap().bitmapData);
		}

		private function _zxingEvt(zxEvt:ZXingEvent):void {
			
			if (zxEvt.type == ZXingEvent.SUCCESS)
				trace(zxEvt.url);
			else
				trace("fail");
		}
	}
}