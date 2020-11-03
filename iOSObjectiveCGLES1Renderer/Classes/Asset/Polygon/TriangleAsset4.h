// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef TriangleAsset4_h
#define TriangleAsset4_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
@interface TriangleAsset4 : BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLESColor*)color;
@end
#endif /* TriangleAsset4_h */
