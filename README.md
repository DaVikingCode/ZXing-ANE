ZXing-ANE
=========

A QR Code, bar code, image recognizer ANE for iOS &amp; Android using [ZXing](https://github.com/zxing/zxing/) lib even on [iOS](https://github.com/TheLevelUp/ZXingObjC).

Note: This ANE doesn't manage camera stuff, it takes a bitmap data as an argument `decodeFromBitmapData` and return a ZXingEvent.SUCCESS with the URL found or a ZXingEvent.FAIL.
