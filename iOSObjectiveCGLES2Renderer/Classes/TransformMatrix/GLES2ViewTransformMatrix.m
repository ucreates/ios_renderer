// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2ViewTransformMatrix.h"
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@implementation GLES2ViewTransformMatrix
- (GLKMatrix4)transform2D {
    return GLKMatrix4Identity;
}
- (GLKMatrix4)transform3D:(GLKVector3)eye center:(GLKVector3)center up:(GLKVector3)up {
    GLKMatrix4 matrix = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    return matrix;
}
@end
