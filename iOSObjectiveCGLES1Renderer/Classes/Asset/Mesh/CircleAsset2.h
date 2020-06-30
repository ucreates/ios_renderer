// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef CircleAsset2_h
#define CircleAsset2_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
@interface CircleAsset2 : BaseAsset {
    int _divideCount;
    GLfloat _radius;
}
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLESColor*)color;
@end
#endif /* CircleAsset2_h */
