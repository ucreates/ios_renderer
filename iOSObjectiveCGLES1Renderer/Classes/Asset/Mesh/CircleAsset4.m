// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "CircleAsset4.h"
#import "GLES1Angle.h"
#import "GLES1Renderer.h"
@interface CircleAsset4 ()
@end
@implementation CircleAsset4
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLESColor*)color {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[VertexArray alloc] init:kDimension2D];
    return self;
}
- (void)create {
    int vertexCount = (self->_divideCount * 3) + 1;
    int verticesLength = vertexCount * kDimension2D;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsLength = vertexCount * kRGBA;
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int indiciesLength = (self->_divideCount * 3) + 1;
    int indiciesMemsize = indiciesLength * sizeof(GLushort);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLushort* indicies = (GLushort*)malloc(indiciesMemsize);
    int didx = 0;
    vertices[0] = 0.0f;
    vertices[1] = 0.0f;
    for (int i = 2; i < verticesLength; i += 4) {
        GLfloat unitDegree = (360.0 / self->_divideCount);
        GLfloat degree1 = (GLfloat)didx * unitDegree;
        GLfloat degree2 = (GLfloat)(didx + 1) * unitDegree;
        GLfloat radian1 = [GLES1Angle toRadian:degree1];
        GLfloat radian2 = [GLES1Angle toRadian:degree2];
        GLfloat x1 = cosf(radian1) * self->_radius;
        GLfloat y1 = sinf(radian1) * self->_radius;
        GLfloat x2 = cosf(radian2) * self->_radius;
        GLfloat y2 = sinf(radian2) * self->_radius;
        vertices[i] = x1;
        vertices[i + 1] = y1;
        vertices[i + 2] = x2;
        vertices[i + 3] = y2;
        didx++;
    }
    colors[0] = 0.0f;
    colors[1] = 0.0f;
    colors[2] = 0.0f;
    colors[3] = 0.0f;
    for (int i = 4; i < colorsLength; i += 8) {
        colors[i] = self->_color.r;
        colors[i + 1] = self->_color.g;
        colors[i + 2] = self->_color.b;
        colors[i + 3] = self->_color.a;
        colors[i + 4] = self->_color.r;
        colors[i + 5] = self->_color.g;
        colors[i + 6] = self->_color.b;
        colors[i + 7] = self->_color.a;
    }
    indicies[indiciesLength - 3] = 0;
    indicies[indiciesLength - 2] = 1;
    indicies[indiciesLength - 1] = 2;
    int currentIndex = 1;
    for (int i = 0; i < indiciesLength; i += 3) {
        indicies[i] = 0;
        indicies[i + 1] = currentIndex;
        indicies[i + 2] = currentIndex + 1;
        currentIndex += 2;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLE_STRIP;
}
@end
