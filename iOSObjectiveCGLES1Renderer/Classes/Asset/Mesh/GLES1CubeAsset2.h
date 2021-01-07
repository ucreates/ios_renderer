// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1CubeAsset2_h
#define GLES1CubeAsset2_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAsset.h"
@interface GLES1CubeAsset2 : GLES1BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLES1Color*)color;
@end
#endif /* GLES1CubeAsset2_h */
