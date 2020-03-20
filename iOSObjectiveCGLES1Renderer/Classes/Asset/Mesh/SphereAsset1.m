// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "SphereAsset1.h"
#import "GLES1Angle.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
@interface SphereAsset1 ()
@end
@implementation SphereAsset1
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLESColor*)color {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[VertexArray alloc] init:kDimension3D];
    return self;
}
- (void)create {
    int vertexCount = (self->_divideCount - 1) * self->_divideCount * 2 * 3;
    int originVerticesLength = self->_divideCount * self->_divideCount * 3;
    int verticesLength = vertexCount * 3;
    int colorsLength = vertexCount * 4;
    int normalsLength = verticesLength;
    int originVerticesMemsize = originVerticesLength * sizeof(GLfloat);
    int verticesMemsize = verticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int normalsMemsize = normalsLength * sizeof(GLfloat);
    GLfloat* originVerticies = (GLfloat*)malloc(originVerticesMemsize);
    GLfloat* verticies = (GLfloat*)malloc(verticesMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* normals = (GLfloat*)malloc(normalsMemsize);
    int vidx = 0;
    for (int i = 0; i < self->_divideCount; i++) {
        GLfloat v = (GLfloat)i / (GLfloat)(self->_divideCount - 1);
        GLfloat vradian = M_PI * v;
        GLfloat y = cosf(vradian);
        GLfloat r = sinf(vradian);
        for (int j = 0; j < self->_divideCount; j++) {
            GLfloat u = (GLfloat)j / (GLfloat)(self->_divideCount - 1);
            GLfloat uradian = 2 * M_PI * u;
            GLfloat x = cosf(uradian) * r;
            GLfloat z = sinf(uradian) * r;
            originVerticies[vidx] = x * self->_radius;
            originVerticies[vidx + 1] = y * self->_radius;
            originVerticies[vidx + 2] = z * self->_radius;
            vidx += 3;
        }
    }
    int iidx = 0;
    for (int j = 0; j < self->_divideCount - 1; ++j) {
        int stack = j * self->_divideCount;
        for (int i = 0; i < self->_divideCount; ++i) {
            int vidx1 = (stack + i) * 3;
            int vidx2 = (stack + i + 1) * 3;
            int vidx3 = (stack + i + self->_divideCount) * 3;
            int vidx4 = (stack + i + self->_divideCount + 1) * 3;
            GLfloat x1 = originVerticies[vidx1];
            GLfloat y1 = originVerticies[vidx1 + 1];
            GLfloat z1 = originVerticies[vidx1 + 2];
            GLfloat x2 = originVerticies[vidx2];
            GLfloat y2 = originVerticies[vidx2 + 1];
            GLfloat z2 = originVerticies[vidx2 + 2];
            GLfloat x3 = originVerticies[vidx3];
            GLfloat y3 = originVerticies[vidx3 + 1];
            GLfloat z3 = originVerticies[vidx3 + 2];
            GLfloat x4 = originVerticies[vidx3];
            GLfloat y4 = originVerticies[vidx3 + 1];
            GLfloat z4 = originVerticies[vidx3 + 2];
            GLfloat x5 = originVerticies[vidx2];
            GLfloat y5 = originVerticies[vidx2 + 1];
            GLfloat z5 = originVerticies[vidx2 + 2];
            GLfloat x6 = originVerticies[vidx4];
            GLfloat y6 = originVerticies[vidx4 + 1];
            GLfloat z6 = originVerticies[vidx4 + 2];
            GLKVector3 triangleNormal1 = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
            GLKVector3 triangleNormal2 = [GLES1Normal toNormal:x4 y1:y4 z1:z4 x2:x5 y2:y5 z2:z5 x3:x6 y3:y6 z3:z6];
            verticies[iidx] = x1;
            verticies[iidx + 1] = y1;
            verticies[iidx + 2] = z1;
            verticies[iidx + 3] = x2;
            verticies[iidx + 4] = y2;
            verticies[iidx + 5] = z2;
            verticies[iidx + 6] = x3;
            verticies[iidx + 7] = y3;
            verticies[iidx + 8] = z3;
            verticies[iidx + 9] = x4;
            verticies[iidx + 10] = y4;
            verticies[iidx + 11] = z4;
            verticies[iidx + 12] = x5;
            verticies[iidx + 13] = y5;
            verticies[iidx + 14] = z5;
            verticies[iidx + 15] = x6;
            verticies[iidx + 16] = y6;
            verticies[iidx + 17] = z6;
            normals[iidx] = triangleNormal1.x;
            normals[iidx + 1] = triangleNormal1.y;
            normals[iidx + 2] = triangleNormal1.z;
            normals[iidx + 3] = triangleNormal1.x;
            normals[iidx + 4] = triangleNormal1.y;
            normals[iidx + 5] = triangleNormal1.z;
            normals[iidx + 6] = triangleNormal1.x;
            normals[iidx + 7] = triangleNormal1.y;
            normals[iidx + 8] = triangleNormal1.z;
            normals[iidx + 9] = triangleNormal2.x;
            normals[iidx + 10] = triangleNormal2.y;
            normals[iidx + 11] = triangleNormal2.z;
            normals[iidx + 12] = triangleNormal2.x;
            normals[iidx + 13] = triangleNormal2.y;
            normals[iidx + 14] = triangleNormal2.z;
            normals[iidx + 15] = triangleNormal2.x;
            normals[iidx + 16] = triangleNormal2.y;
            normals[iidx + 17] = triangleNormal2.z;
            iidx += 18;
        }
    }
    for (int i = 0; i < colorsLength; i += 4) {
        colors[i] = self->_color.r;
        colors[i + 1] = self->_color.g;
        colors[i + 2] = self->_color.b;
        colors[i + 3] = self->_color.a;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setNormals:normals normalsCount:normalsLength];
    free(originVerticies);
    free(verticies);
    free(colors);
    free(normals);
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return self->_vertex;
}
@end
