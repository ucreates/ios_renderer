// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1WipeAsset1_h
#define GLES1WipeAsset1_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseWipeAsset.h"
@interface GLES1WipeAsset1 : GLES1BaseWipeAsset
- (id)init:(GLfloat)radius divideCount:(int)divideCount maxScale:(GLfloat)maxScale;
@end
#endif /* GLES1WipeAsset1_h */
