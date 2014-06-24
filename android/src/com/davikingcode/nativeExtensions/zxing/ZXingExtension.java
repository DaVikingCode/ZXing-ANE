package com.davikingcode.nativeExtensions.zxing;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ZXingExtension implements FREExtension
{
	@Override
	public FREContext createContext( String label )
	{
		return new ZXingExtensionContext();
	}

	@Override
	public void dispose()
	{
	}

	@Override
	public void initialize()
	{
	}
}
