ZXing-ANE
=========

A QR Code, bar code, image recognizer ANE for iOS &amp; Android using [ZXing](https://github.com/zxing/zxing/) lib even on [iOS](https://github.com/TheLevelUp/ZXingObjC).
There is a default implementation for Web &amp; Desktop player using pure [AS3](https://github.com/zxing/zxing/tree/c1df162b95e07928afbd4830798cc1408af1ac67/actionscript).

**Be careful**, this ANE doesn't only check for QRCode but for all formats supported by the ZXing library. A future version optimized should add argument for the format requested.

Note: This ANE doesn't manage camera stuff, it takes a bitmap data as an argument `decodeFromBitmapData` and return a ZXingEvent.SUCCESS with the URL found or a ZXingEvent.FAIL.

```actionscript3
var zxing:ZXing = new ZXing();
zxing.addEventListener(ZXingEvent.FAIL, _zxingEvt);
zxing.addEventListener(ZXingEvent.SUCCESS, _zxingEvt);

zxing.decodeFromBitmapData(new qrCodeBitmap().bitmapData);

private function _zxingEvt(zxEvt:ZXingEvent):void {

	if (zxEvt.type == ZXingEvent.SUCCESS)
		trace(zxEvt.url);
	else
		trace("fail");
}
```

If you get this `Error: The extension com.davikingcode.nativeExtensions.ZXing has either a namespace version or library.swf with a version that is incompatible with the applications namespace or root SWF.` it means that you must compile your SWF with an upper swf version than your default. For example add `-swf-version=25` to your command line.

If you get `Error while loading initial content` it means that you need to change your `-swf-version` too!