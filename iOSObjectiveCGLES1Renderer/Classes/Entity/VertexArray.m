// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "VertexArray.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
static const int kVertexCountPerTriangle = 3;
@implementation VertexArray
- (id)init:(int)dimension {
    self->_dimension = dimension;
    self->_verticies = nil;
    self->_colors = nil;
    self->_normals = nil;
    return self;
}
- (void)releaseBuffer {
    if (nil != self->_verticies) {
        free(self->_verticies);
        self->_verticies = nil;
    }
    if (nil != self->_colors) {
        free(self->_colors);
        self->_colors = nil;
    }
    if (nil != self->_normals) {
        free(self->_normals);
        self->_normals = nil;
    }
    return;
}
- (void)setVertexCount:(int)count {
    self->_vertexCount = count;
    return;
}
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount {
    if (0 == verticiesCount) {
        return;
    }
    int memsize = verticiesCount * sizeof(GLfloat);
    self->_verticies = (GLfloat*)malloc(memsize);
    for (int i = 0; i < verticiesCount; i++) {
        self->_verticies[i] = verticies[i];
    }
    return;
}
- (void)setColors:(GLfloat*)vertexColors vertexColorsCount:(int)vertexColorsCount {
    if (0 == vertexColorsCount) {
        return;
    }
    int memsize = vertexColorsCount * sizeof(GLfloat);
    self->_colors = (GLfloat*)malloc(memsize);
    for (int i = 0; i < vertexColorsCount; i++) {
        self->_colors[i] = vertexColors[i];
    }
    self->_vertexColorCount = vertexColorsCount;
    return;
}
- (void)setNormals:(GLfloat*)verticies verticiesCount:(int)verticiesCount {
    if (0 == verticiesCount || kDimension2D == self.dimension) {
        return;
    }
    int memsize = self->_vertexCount * kDimension3D * sizeof(GLfloat);
    self->_normals = (GLfloat*)malloc(memsize);
    int triangleCount = verticiesCount / (kVertexCountPerTriangle * self.dimension);
    int vidx = 0;
    for (int i = 0; i < triangleCount; i++) {
        GLfloat x1 = verticies[vidx];
        GLfloat y1 = verticies[vidx + 1];
        GLfloat z1 = verticies[vidx + 2];
        GLfloat x2 = verticies[vidx + 3];
        GLfloat y2 = verticies[vidx + 4];
        GLfloat z2 = verticies[vidx + 5];
        GLfloat x3 = verticies[vidx + 6];
        GLfloat y3 = verticies[vidx + 7];
        GLfloat z3 = verticies[vidx + 8];
        GLfloat vx1 = x2 - x1;
        GLfloat vy1 = y2 - y1;
        GLfloat vz1 = z2 - z1;
        GLfloat vx2 = x3 - x1;
        GLfloat vy2 = y3 - y1;
        GLfloat vz2 = z3 - z1;
        GLfloat nx = vy1 * vz2 - vz1 * vy2;
        GLfloat ny = vz1 * vx2 - vx1 * vz2;
        GLfloat nz = vx1 * vy2 - vy1 * vx2;
        self->_normals[vidx] = nx;
        self->_normals[vidx + 1] = ny;
        self->_normals[vidx + 2] = nz;
        self->_normals[vidx + 3] = nx;
        self->_normals[vidx + 4] = ny;
        self->_normals[vidx + 5] = nz;
        self->_normals[vidx + 6] = nx;
        self->_normals[vidx + 7] = ny;
        self->_normals[vidx + 8] = nz;
        vidx += 9;
        NSLog(@"normal vector.x::%f,vector.y::%f,vector.z::%f", nx, ny, nz);
    }
    return;
}
- (void)setRandomColor {
    for (int i = 0; i < self->_vertexColorCount; i++) {
        int color = rand() % 255;
        self->_colors[i] = (float)color / 255.0f;
    }
    return;
}
- (int)dimension {
    return self->_dimension;
}
- (int)count {
    return self->_vertexCount;
}
- (GLfloat*)verticies {
    return self->_verticies;
}
- (GLfloat*)colors {
    return self->_colors;
}
- (GLfloat*)normals {
    return self->_normals;
}
@end
