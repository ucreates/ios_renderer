// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1MaterialAsset_h
#define GLES1MaterialAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Color.h"
#import "GLES1Material.h"
#import "GLES1TextureAsset.h"
@interface GLES1MaterialAsset : NSObject
- (id)init;
- (NSMutableDictionary<NSString*, GLES1Material*>*)create:(NSString*)mtlPath;
@end
#endif /* GLES1MaterialAsset_h */
