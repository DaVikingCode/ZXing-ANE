package {

	import com.davikingcode.nativeExtensions.zbar.ZBar;

	import flash.display.Sprite;

	[SWF(width='320', height='480', frameRate='30', backgroundColor='#000000')]

	public class ZBarTest extends Sprite {
		
		[Embed(source="/../../embed/qrcode.jpg")]
		private const qrCodeBitmap:Class;

		public function ZBarTest() {
			
			var zbar:ZBar = new ZBar();
			zbar.init(new qrCodeBitmap().bitmapData);

		}
	}
}