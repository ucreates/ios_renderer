// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef MaterialAsset_h
#define MaterialAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
#import "Material.h"
#import "TextureAsset.h"
@interface MaterialAsset : NSObject
- (id)init;
- (NSMutableDictionary<NSString*, Material*>*)create:(NSString*)mtlPath;
@end
#endif /* MaterialAsset_h */
