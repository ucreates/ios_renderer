// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2SphereAsset2_h
#define GLES2SphereAsset2_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES2BaseAsset.h"
@interface GLES2SphereAsset2 : GLES2BaseAsset {
    int _divideCount;
    GLfloat _radius;
}
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLES2Color*)color bufferType:(int)bufferType;
@end
#endif /* GLES2SphereAsset2_h */
