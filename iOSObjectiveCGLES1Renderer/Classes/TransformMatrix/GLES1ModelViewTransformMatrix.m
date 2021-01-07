// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1ModelViewTransformMatrix.h"
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "glu.h"
@implementation GLES1ModelViewTransformMatrix
- (void)transform2D {
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    return;
}
- (void)transform3D:(GLKVector3)eye center:(GLKVector3)center up:(GLKVector3)up {
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    return;
}
@end
