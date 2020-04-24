// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef WipeAsset1_h
#define WipeAsset1_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseWipeAsset.h"
@interface WipeAsset1 : BaseWipeAsset
- (id)init:(GLfloat)radius divideCount:(int)divideCount maxScale:(GLfloat)maxScale;
@end
#endif /* WipeAsset1_h */
