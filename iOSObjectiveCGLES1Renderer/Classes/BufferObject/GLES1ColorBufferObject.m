// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1ColorBufferObject.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@implementation GLES1ColorBufferObject
- (void)allocateBuffer {
    GLuint bid = 0;
    glGenRenderbuffersOES(1, &bid);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, bid);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, bid);
    self->_bufferId = bid;
    return;
}
- (void)releaseBuffer {
    if (0 == self->_bufferId) {
        return;
    }
    glDeleteRenderbuffersOES(1, &self->_bufferId);
    self->_bufferId = 0;
    return;
}
- (void)bind {
    if (0 == self->_bufferId) {
        return;
    }
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, self->_bufferId);
    return;
}
@end
