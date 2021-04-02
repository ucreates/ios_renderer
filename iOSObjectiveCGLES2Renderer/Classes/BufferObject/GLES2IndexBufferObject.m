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
#import "GLES2IndexBufferObject.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Renderer.h"
#import "GLES2Shader.h"
@implementation GLES2IndexBufferObject
- (id)init {
    return self;
}
- (void)allocateBuffer {
    GLuint bid = 0;
    glGenBuffers(1, &bid);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, bid);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, self->_indiciesMemsize, self->_indicies, GL_STATIC_DRAW);
    self->_bufferId = bid;
    return;
}
- (void)bind {
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.bufferId);
    return;
}
- (void)setIndicies:(GLushort*)indicies indiciesCount:(int)indiciesCount {
    if (0 == indiciesCount) {
        return;
    }
    self->_indiciesMemsize = indiciesCount * sizeof(GLushort);
    self->_indicies = (GLushort*)malloc(self->_indiciesMemsize);
    for (int i = 0; i < indiciesCount; i++) {
        self->_indicies[i] = indicies[i];
    }
    self->_indexCount = indiciesCount;
    return;
}
- (int)count {
    return self->_indexCount;
}
@end
