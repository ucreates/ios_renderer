// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2RectangleAsset1_h
#define GLES2RectangleAsset1_h
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2BaseAsset.h"
@interface GLES2RectangleAsset1 : GLES2BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLES2Color*)color bufferType:(int)bufferType;
@end
#endif /* GLES2RectangleAsset1_h */
