//
//  ZBarIosExtension.m
//  ZBarIosExtension
//
//  Created by Aymeric Lamboley on 20/06/2014.
//  Copyright (c) 2014 DaVikingCode. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import "ZXingObjC.h"

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define MAP_FUNCTION(fn, data) { (const uint8_t*)(#fn), (data), &(fn) }

DEFINE_ANE_FUNCTION(init) {
    
    NSLog(@"ok");
    
    FREBitmapData bitmapData;
    FREAcquireBitmapData(argv[0], &bitmapData);
    
    int width       = bitmapData.width;
    int height      = bitmapData.height;
    int stride      = bitmapData.lineStride32 * 4;
    uint32_t* input = bitmapData.bits32;
    
    // make data provider from buffer
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, bitmapData.bits32, (width * height * 4), NULL);
    
    // set up for CGImage creation
    
    int                     bitsPerComponent    = 8;
    int                     bitsPerPixel        = 32;
    int                     bytesPerRow         = 4 * width;
    CGColorSpaceRef         colorSpaceRef       = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo            bitmapInfo;
    
    if( bitmapData.hasAlpha )
        
    {
        
        if( bitmapData.isPremultiplied )
            
            bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst;
        
        else
            
            bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaFirst;
        
    }  else {
        bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst;
        
    }
    
    CGColorRenderingIntent  renderingIntent     = kCGRenderingIntentDefault;
    
    CGImageRef              imageToDecode            = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    
    ZXLuminanceSource *source = [[ZXCGImageLuminanceSource alloc] initWithCGImage:imageToDecode];
    ZXBinaryBitmap *bitmap = [ZXBinaryBitmap binaryBitmapWithBinarizer:[ZXHybridBinarizer binarizerWithSource:source]];
    
    NSError *error = nil;
    
    // There are a number of hints we can give to the reader, including
    // possible formats, allowed lengths, and the string encoding.
    ZXDecodeHints *hints = [ZXDecodeHints hints];
    
    ZXMultiFormatReader *reader = [ZXMultiFormatReader reader];
    ZXResult *result = [reader decode:bitmap
                                hints:hints
                                error:&error];
    if (result) {
        // The coded result as a string. The raw data can be accessed with
        // result.rawBytes and result.length.
        
        const uint8_t* params = (const uint8_t*) [result.text UTF8String];
        const uint8_t* event = (const uint8_t*) [@"SUCCESS" UTF8String];
        
        FREDispatchStatusEventAsync(context, event, params);
        
        // The barcode format, such as a QR code or UPC-A
        //ZXBarcodeFormat format = result.barcodeFormat;
    } else {
        // Use error to determine why we didn't get a result, such as a barcode
        // not being found, an invalid checksum, or a format inconsistency.
        
        const uint8_t* params = (const uint8_t*) [@"" UTF8String];
        const uint8_t* event = (const uint8_t*) [@"FAIL" UTF8String];
        
        FREDispatchStatusEventAsync(context, event, params);
    }
    
    FREReleaseBitmapData(argv[0]);
    
    
    return NULL;
}

void ZBarContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION(init, NULL )
    };
    
    *numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
    *functionsToSet = functionMap;
    
}

void ZBarContextFinalizer(FREContext ctx) {
    return;
}

void ZBarExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet ) {
    
    extDataToSet = NULL; // This example does not use any extension data.
    *ctxInitializerToSet = &ZBarContextInitializer;
    *ctxFinalizerToSet = &ZBarContextFinalizer;
}

void ZBarExtensionFinalizer() {
    return;
}