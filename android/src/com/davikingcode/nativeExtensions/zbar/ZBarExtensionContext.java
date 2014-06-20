package com.davikingcode.nativeExtensions.zbar;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class ZBarExtensionContext extends FREContext
{
	@Override
	public void dispose()
	{
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		//functionMap.put( "getAdScaleFactor", new MoPubGetAdScaleFactor() );
		return functionMap;
	}
}
