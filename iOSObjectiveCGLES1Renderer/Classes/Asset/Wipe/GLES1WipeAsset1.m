// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1WipeAsset1.h"
#import "GLES1Angle.h"
#import "GLES1Renderer.h"
@interface GLES1WipeAsset1 ()
@end
@implementation GLES1WipeAsset1
- (id)init:(GLfloat)radius divideCount:(int)divideCount maxScale:(GLfloat)maxScale {
    self = [super init];
    self->_radius = radius;
    self->_color = GLES1Color.black;
    self->_divideCount = divideCount;
    self->_maxScale = maxScale;
    return self;
}
- (void)create2D {
    int vertexCount = self->_divideCount * kTriangleVertexCount;
    int verticesLength = vertexCount * kDimension2D;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsLength = vertexCount * kRGBA;
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    int didx = 0;
    for (int i = 0; i < verticesLength; i += (kTriangleVertexCount * kDimension2D)) {
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
    for (int i = 0; i < colorsLength; i += (kTriangleVertexCount * kRGBA)) {
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
    self->_vertex = [[GLES1VertexArray alloc] init:kDimension2D];
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    return;
}
- (void)create3D {
    int vertexCount = self->_divideCount * kDimension3D;
    int verticesLength = vertexCount * kDimension3D;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsLength = vertexCount * kRGBA;
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    int didx = 0;
    for (int i = 0; i < verticesLength; i += (kTriangleVertexCount * kDimension3D)) {
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
        vertices[i + 2] = 0;
        vertices[i + 3] = x2;
        vertices[i + 4] = y2;
        vertices[i + 5] = 0;
        vertices[i + 6] = x1;
        vertices[i + 7] = y1;
        vertices[i + 8] = 0;
        didx++;
    }
    for (int i = 0; i < colorsLength; i += (kTriangleVertexCount * kRGBA)) {
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
    self->_vertex = [[GLES1VertexArray alloc] init:kDimension3D];
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
@end
