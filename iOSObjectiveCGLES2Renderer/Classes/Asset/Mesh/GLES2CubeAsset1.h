// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2CubeAsset1_h
#define GLES2CubeAsset1_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2BaseAsset.h"
@interface GLES2CubeAsset1 : GLES2BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLES2Color*)color bufferType:(int)bufferType;
@end
#endif /* GLES2CubeAsset1_h */
