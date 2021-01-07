// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1RectangleAsset1_h
#define GLES1RectangleAsset1_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAsset.h"
@interface GLES1RectangleAsset1 : GLES1BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLES1Color*)color;
@end
#endif /* GLES1RectangleAsset1_h */
