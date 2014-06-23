package com.davikingcode.nativeExtensions.zbar;

import android.graphics.Bitmap;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREBitmapData;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.RGBLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

public class ZBarInit implements FREFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {

		//http://stackoverflow.com/questions/17314467/bitmap-channels-order-different-in-android

		try {

			FREBitmapData bitmapData = (FREBitmapData)args[0];

			bitmapData.acquire();

			int srcWidth = bitmapData.getWidth();
			int srcHeight = bitmapData.getHeight();
			

			Bitmap imageBitmap = Bitmap.createBitmap(srcWidth, srcHeight, Bitmap.Config.ARGB_8888);

			imageBitmap.copyPixelsFromBuffer(bitmapData.getBits());

			bitmapData.release();

			int[] pixels = new int[srcWidth * srcHeight];
			imageBitmap.getPixels(pixels, 0, srcWidth, 0, 0, srcWidth, srcHeight);

			RGBLuminanceSource source = new RGBLuminanceSource(srcWidth, srcHeight, pixels);

			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(source));
			Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap);
    		//Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap, hintMap);

			context.dispatchStatusEventAsync("SUCCESS", qrCodeResult.getText());

			//context.dispatchStatusEventAsync("FAIL", "");

		} catch (Exception e) {

			Log.w("ZBarInit", e);
		}
	
		return null;
	}
}