// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "ProjectonTransfomMatrix.h"
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "glu.h"
@implementation ProjectonTransfomMatrix
- (void)transform2D:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far {
    GLfloat left = aspectRatio * -1.0f;
    GLfloat right = aspectRatio;
    GLfloat top = 1.0f;
    GLfloat bottom = -1.0f;
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrthof(left, right, bottom, top, near, far);
    return;
}
- (void)transform3D:(GLfloat)fov aspectRatio:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far {
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(fov, aspectRatio, near, far);
    return;
}
@end
