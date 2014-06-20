package com.davikingcode.nativeExtensions.zbar;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ZBarExtension implements FREExtension
{
	@Override
	public FREContext createContext( String label )
	{
		return new ZBarExtensionContext();
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
