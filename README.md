ZBar-ANE
========

A QR Code, bar code, image recognizer ANE for iOS &amp; Android

I thought using [ZBar](http://zbar.sourceforge.net/), but finally using [ZXing](https://github.com/zxing/zxing/) lib even on [iOS](https://github.com/TheLevelUp/ZXingObjC).

Note: This ANE doesn't manage camera stuff, it takes a bitmap data as an argument and return a ZBarEvent.SUCCESS event with the URL found or a ZBarEvent.FAIL Event.
