package com.davikingcode.nativeExtensions.zxing;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class ZXingExtensionContext extends FREContext
{
	@Override
	public void dispose()
	{
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put( "init", new ZXingInit() );
		return functionMap;
	}
}
