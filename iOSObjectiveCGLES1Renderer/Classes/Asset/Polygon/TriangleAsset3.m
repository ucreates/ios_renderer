// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TriangleAsset3.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
@interface TriangleAsset3 ()
@end
@implementation TriangleAsset3
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLESColor*)color {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_color = color;
    self->_vertex = [[VertexArray alloc] init:kDimension2D];
    return self;
}
- (void)create {
    GLfloat x = 0.5f * self->_width;
    GLfloat y = 0.5f * self->_height;
    GLfloat vertices[] = {
        // left down
        -x,
        -y,
        // right down
        x,
        -y,
        // center top
        0.0f,
        y,
    };
    GLfloat colors[] = {
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
    int verticesLength = sizeof(vertices) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int vertexCount = verticesLength / self.vertex.dimension;
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLE_STRIP;
}
@end
