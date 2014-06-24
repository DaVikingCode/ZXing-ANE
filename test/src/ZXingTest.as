package {

	import com.davikingcode.nativeExtensions.zbar.ZXingEvent;
	import com.davikingcode.nativeExtensions.zbar.ZXing;

	import flash.display.Sprite;

	[SWF(width='320', height='480', frameRate='30', backgroundColor='#000000')]

	public class ZBarTest extends Sprite {
		
		[Embed(source="/../../embed/qrcode.jpg")]
		private const qrCodeBitmap:Class;

		public function ZXingTest() {
			
			var zxing:ZXing = new ZXing();
			zxing.addEventListener(ZXingEvent.FAIL, _zxingEvt);
			zxing.addEventListener(ZXingEvent.SUCCESS, _zxingEvt);
			
			zxing.init(new qrCodeBitmap().bitmapData);
		}

		private function _zxingEvt(zxEvt:ZXingEvent):void {
			
			if (zxEvt.type == ZXingEvent.SUCCESS)
				trace(zxEvt.url);
			else
				trace("fail");
		}
	}
}