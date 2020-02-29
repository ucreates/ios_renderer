// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "FrameBufferObject.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@implementation FrameBufferObject
- (void)allocateBuffer {
    GLuint bid = 0;
    glGenFramebuffersOES(1, &bid);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, bid);
    self->_bufferId = bid;
    return;
}
- (void)releaseBuffer {
    if (0 == self->_bufferId) {
        return;
    }
    glDeleteFramebuffersOES(1, &self->_bufferId);
    self->_bufferId = 0;
    return;
}
- (void)bind {
    if (0 == self->_bufferId) {
        return;
    }
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, self->_bufferId);
    return;
}
@end
