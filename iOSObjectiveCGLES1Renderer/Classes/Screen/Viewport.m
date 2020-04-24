// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Viewport.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface Viewport ()
@property GLint width;
@property GLint height;
@end
@implementation Viewport
@synthesize width;
@synthesize height;
- (id)init {
    return self;
}
- (void)update:(GLES1Camera*)camera {
    glViewport(0, 0, self->width, self->height);
    GLfloat r = camera.clearColor.r;
    GLfloat g = camera.clearColor.g;
    GLfloat b = camera.clearColor.b;
    GLfloat a = camera.clearColor.a;
    glClearStencil(0);
    glClearColor(r, g, b, a);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
    return;
}
- (void)setScreenSize:(GLuint)width height:(GLint)height {
    glViewport(0, 0, width, height);
    self.width = width;
    self.height = height;
    return;
}
- (GLfloat)getAspectRatio {
    GLfloat aspectRatio = (GLfloat)self->width / (GLfloat)self->height;
    return aspectRatio;
}
@end
