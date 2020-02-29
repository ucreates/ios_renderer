// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TriangleAsset1.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface TriangleAsset1 ()
@end
@implementation TriangleAsset1
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLESColor*)color {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_color = color;
    self->_vertex = [[VertexArray alloc] init:2];
    return self;
}
- (void)create {
    GLfloat verticies[] = {
        // left down
        -0.5f * self->_width,
        -0.5f * self->_height,
        // right down
        0.5f * self->_width,
        -0.5f * self->_height,
        // center top
        0.0f,
        0.5f * self->_height,
    };
    GLfloat vertexColors[] = {
        // left down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // right down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // center top
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
    };
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int vertexColorsLength = sizeof(vertexColors) / sizeof(GLfloat);
    int vertexCount = verticiesLength / self.vertex.dimension;
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:vertexColors vertexColorsCount:vertexColorsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return self->_vertex;
}
@end
