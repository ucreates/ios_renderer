// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Vertex.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Renderer.h"
@implementation GLES2Vertex
- (id)init:(int)dimension bufferType:(int)bufferType {
    if (kVBO == bufferType) {
        self->_vo = [[GLES2VertexBufferObject alloc] init:dimension];
    } else if (kVAO == bufferType) {
        self->_vo = [[GLES2VertexArrayObject alloc] init:dimension];
    }
    return self;
}
- (void)releaseBuffer {
    if (nil != self->_vo) {
        [self->_vo releaseBuffer];
    }
    return;
}
- (void)allocateBuffer {
    if (nil != self->_vo) {
        [self->_vo allocateBuffer];
    }
    return;
}
- (void)bind:(GLES2ProgramObject*)programObject {
    if (nil != self->_vo) {
        [self->_vo bind:programObject];
    }
    return;
}
- (void)setVertexCount:(int)count {
    if (nil != self->_vo) {
        [self->_vo setVertexCount:count];
    }
    return;
}
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount {
    if (nil != self->_vo) {
        [self->_vo setVerticies:verticies verticiesCount:verticiesCount];
    }
    return;
}
- (void)setColors:(GLfloat*)colors colorsCount:(int)colorsCount {
    if (nil != self->_vo) {
        [self->_vo setColors:colors colorsCount:colorsCount];
    }
    return;
}
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount {
    if (nil != self->_vo) {
        [self->_vo setUVs:uvs uvsCount:uvsCount];
    }
    return;
}
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount {
    if (nil != self->_vo) {
        [self->_vo setNormals:normals normalsCount:normalsCount];
    }
    return;
}
- (void)setRandomColor:(NSString*)uniformName programObject:(GLES2ProgramObject*)programObject {
    if (nil != self->_vo) {
        [self->_vo setRandomColor:uniformName programObject:programObject];
    }
    return;
}
- (int)dimension {
    int dimension = 0;
    if (nil != self->_vo) {
        dimension = self->_vo.dimension;
    }
    return dimension;
}
- (int)count {
    int count = 0;
    if (nil != self->_vo) {
        count = self->_vo.count;
    }
    return count;
}
- (GLfloat*)verticies {
    GLfloat* verticies = nil;
    if (nil != self->_vo) {
        verticies = self->_vo.elements;
    }
    return verticies;
}
@end
