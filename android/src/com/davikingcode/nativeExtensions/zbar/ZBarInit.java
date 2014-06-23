package com.davikingcode.nativeExtensions.zbar;

import android.graphics.Bitmap;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREBitmapData;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
//import com.google.zxing.RGBLuminanceSource;

public class ZBarInit implements FREFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {

		//http://stackoverflow.com/questions/17314467/bitmap-channels-order-different-in-android

		try {

			FREBitmapData bitmapData = (FREBitmapData) args[0];

			bitmapData.acquire();

			bitmapData.release();
			//bitmapData.getWidth();

			//Bitmap imageBitmap = Bitmap.createBitmap(bitmapData.getWidth(), bitmapData.getHeight(), Bitmap.Config.ARGB_8888);

			/*int width = imageBitmap.getWidth();
			int height = imageBitmap.getHeight();
			int[] pixels = new int[width * height];
			imageBitmap.getPixels(pixels, 0, width, 0, 0, width, height);*/

			//RGBLuminanceSource source = new RGBLuminanceSource(width, height, pixels);

			context.dispatchStatusEventAsync("FAIL", "");

		} catch (Exception e) {

			Log.w( "ZBarInit", e );
		}
	
		return null;
	}
}