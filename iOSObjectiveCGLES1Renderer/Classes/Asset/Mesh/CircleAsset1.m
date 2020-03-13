// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "CircleAsset1.h"
#import "GLES1Angle.h"
#import "GLES1Renderer.h"
@interface CircleAsset1 ()
@end
@implementation CircleAsset1
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLESColor*)color {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[VertexArray alloc] init:kDimension2D];
    return self;
}
- (void)create {
    int vertexCount = self->_divideCount * 3;
    int verticesLength = vertexCount * kDimension2D;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsLength = vertexCount * kRGBA;
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    int didx = 0;
    for (int i = 0; i < verticesLength; i += 6) {
        GLfloat unitDegree = (360.0 / self->_divideCount);
        GLfloat degree1 = (GLfloat)didx * unitDegree;
        GLfloat degree2 = (GLfloat)(didx + 1) * unitDegree;
        GLfloat radian1 = [GLES1Angle toRadian:degree1];
        GLfloat radian2 = [GLES1Angle toRadian:degree2];
        GLfloat x1 = cosf(radian1) * self->_radius;
        GLfloat y1 = sinf(radian1) * self->_radius;
        GLfloat x2 = cosf(radian2) * self->_radius;
        GLfloat y2 = sinf(radian2) * self->_radius;
        vertices[i] = 0;
        vertices[i + 1] = 0;
        vertices[i + 2] = x1;
        vertices[i + 3] = y1;
        vertices[i + 4] = x2;
        vertices[i + 5] = y2;
        didx++;
    }
    for (int i = 0; i < colorsLength; i += 12) {
        colors[i] = self->_color.r;
        colors[i + 1] = self->_color.g;
        colors[i + 2] = self->_color.b;
        colors[i + 3] = self->_color.a;
        colors[i + 4] = self->_color.r;
        colors[i + 5] = self->_color.g;
        colors[i + 6] = self->_color.b;
        colors[i + 7] = self->_color.a;
        colors[i + 8] = self->_color.r;
        colors[i + 9] = self->_color.g;
        colors[i + 10] = self->_color.b;
        colors[i + 11] = self->_color.a;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return self->_vertex;
}
@end
