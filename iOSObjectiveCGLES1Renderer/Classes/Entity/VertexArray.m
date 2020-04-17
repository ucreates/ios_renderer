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
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount {
    if (0 == normalsCount) {
        return;
    }
    int memsize = normalsCount * sizeof(GLfloat);
    self->_normals = (GLfloat*)malloc(memsize);
    for (int i = 0; i < normalsCount; i++) {
        self->_normals[i] = normals[i];
    }
    return;
}
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount {
    if (0 == uvsCount) {
        return;
    }
    int memsize = uvsCount * sizeof(GLfloat);
    self->_uvs = (GLfloat*)malloc(memsize);
    for (int i = 0; i < uvsCount; i++) {
        self->_uvs[i] = uvs[i];
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
- (void)setAlpha:(GLfloat)alpha {
    for (int i = 3; i < self->_vertexColorCount; i += 4) {
        self->_colors[i] = alpha;
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
- (GLfloat*)uvs {
    return self->_uvs;
}
@end

