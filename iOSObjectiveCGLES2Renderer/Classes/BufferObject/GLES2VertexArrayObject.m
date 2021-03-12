// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#define BUFFER_OFFSET(i) ((char*)NULL + (i))
#import "GLES2VertexArrayObject.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Renderer.h"
#import "GLES2Shader.h"
@implementation GLES2VertexArrayObject
- (id)init:(int)dimension {
    self = [super init:dimension];
    return self;
}
- (void)allocateBuffer {
    GLuint vaoId = 0;
    glGenVertexArraysOES(1, &vaoId);
    [super allocateBuffer];
    glBindVertexArrayOES(0);
    self->_bufferId = vaoId;
    return;
}
- (void)bind:(GLES2ProgramObject*)programObject {
    [super bind:programObject];
    glBindVertexArrayOES(self.bufferId);
    return;
}
@end
