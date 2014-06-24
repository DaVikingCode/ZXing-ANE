package com.davikingcode.nativeExtensions.zxing;

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

public class ZXingDecodeFromBitmapData implements FREFunction {

	@Override
	public FREObject call( FREContext context, FREObject[] args ) {

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

			try {

				Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap);

				context.dispatchStatusEventAsync("SUCCESS", qrCodeResult.getText());


			} catch (Exception e) {

				context.dispatchStatusEventAsync("FAIL", "");

				Log.w("ZXingDecodeFromBitmapData", e);
			}

		} catch (Exception e) {

			Log.w("ZXingDecodeFromBitmapData", e);
		}
	
		return null;
	}
}