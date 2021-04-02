// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2CubeAsset2_h
#define GLES2CubeAsset2_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES2BaseAsset.h"
@interface GLES2CubeAsset2 : GLES2BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLES2Color*)color bufferType:(int)bufferType;
@end
#endif /* GLES2CubeAsset2_h */
