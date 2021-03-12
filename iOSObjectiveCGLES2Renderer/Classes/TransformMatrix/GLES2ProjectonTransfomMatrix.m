// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2ProjectonTransfomMatrix.h"
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@implementation GLES2ProjectonTransfomMatrix
- (GLKMatrix4)transform2D:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far {
    GLfloat left = aspectRatio * -1.0f;
    GLfloat right = aspectRatio;
    GLfloat top = 1.0f;
    GLfloat bottom = -1.0f;
    GLKMatrix4 matrix = GLKMatrix4MakeOrtho(left, right, bottom, top, near, far);
    return matrix;
}
- (GLKMatrix4)transform3D:(GLfloat)fov aspectRatio:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far {
    GLfloat fovRad = GLKMathDegreesToRadians(fov);
    GLKMatrix4 matrix = GLKMatrix4MakePerspective(fovRad, aspectRatio, near, far);
    return matrix;
}
@end
