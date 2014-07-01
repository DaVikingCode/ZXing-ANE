ZXing-ANE
=========

A QR Code, bar code, image recognizer ANE for iOS &amp; Android using [ZXing](https://github.com/zxing/zxing/) lib even on [iOS](https://github.com/TheLevelUp/ZXingObjC).

There is a default implementation for Web &amp; Desktop player using pure [AS3](https://github.com/zxing/zxing/tree/c1df162b95e07928afbd4830798cc1408af1ac67/actionscript).

Note: This ANE doesn't manage camera stuff, it takes a bitmap data as an argument `decodeFromBitmapData` and return a ZXingEvent.SUCCESS with the URL found or a ZXingEvent.FAIL.

If you get this `Error: The extension com.davikingcode.nativeExtensions.ZXing has either a namespace version or library.swf with a version that is incompatible with the applications namespace or root SWF.` it means that you must compile your SWF with an upper swf version than your default. For example add `-swf-version=25` to your command line.

If you get `Error while loading initial content` it means that you need to change your `-swf-version` too!