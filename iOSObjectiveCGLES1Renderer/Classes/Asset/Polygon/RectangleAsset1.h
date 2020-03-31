// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef RectangleAsset1_h
#define RectangleAsset1_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
@interface RectangleAsset1 : BaseAsset
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLESColor*)color;
@end
#endif /* RectangleAsset1_h */