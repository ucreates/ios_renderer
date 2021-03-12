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
#import "GLES2BaseVertexBufferObject.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Renderer.h"
#import "GLES2Shader.h"
@implementation GLES2BaseVertexBufferObject
- (id)init:(int)dimension {
    self->_dimension = dimension;
    self->_count = 0;
    self->_vertexCount = 0;
    self->_colorsCount = 0;
    self->_elementsCount = 0;
    self->_elementsCountPerVertex = 0;
    self->_stride = 0;
    self->_elements = nil;
    self->_verticies = nil;
    self->_colors = nil;
    return self;
}
- (void)setVertexCount:(int)count {
    self->_count = count;
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
    self->_vertexCount = verticiesCount;
    return;
}
- (void)setColors:(GLfloat*)colors colorsCount:(int)colorsCount {
    if (0 == colorsCount) {
        return;
    }
    int memsize = colorsCount * sizeof(GLfloat);
    self->_colors = (GLfloat*)malloc(memsize);
    for (int i = 0; i < colorsCount; i++) {
        self->_colors[i] = colors[i];
    }
    self->_colorsCount = colorsCount;
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
    self->_uvsCount = uvsCount;
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
    self->_normalsCount = normalsCount;
    return;
}
- (void)setRandomColor:(NSString*)uniformName programObject:(GLES2ProgramObject*)programObject {
    float r = [GLES2Color getRandomColor];
    float g = [GLES2Color getRandomColor];
    float b = [GLES2Color getRandomColor];
    [GLES2Shader setUniform4f:uniformName programObjectHandle:programObject.handle value1:r value2:g value3:b value4:1.0f];
    return;
}
- (void)bind:(GLES2ProgramObject*)programObject {
    if (0 < self->_vertexCount) {
        glEnableVertexAttribArray(programObject.positionLocation);
        glVertexAttribPointer(programObject.positionLocation, self->_dimension, GL_FLOAT, GL_FALSE, self->_stride, BUFFER_OFFSET(0));
    }
    if (0 < self->_colorsCount) {
        int colorStartPointer = self->_dimension * sizeof(GLfloat);
        glEnableVertexAttribArray(programObject.colorLocation);
        glVertexAttribPointer(programObject.colorLocation, kRGBA, GL_FLOAT, GL_FALSE, self->_stride, BUFFER_OFFSET(colorStartPointer));
    }
    if (0 < self->_uvsCount) {
        int uvStartPointer = (self->_dimension + kRGBA) * sizeof(GLfloat);
        glEnableVertexAttribArray(programObject.uvLocation);
        glVertexAttribPointer(programObject.uvLocation, kDimension2D, GL_FLOAT, GL_FALSE, self->_stride, BUFFER_OFFSET(uvStartPointer));
    }
    if (0 < self->_normalsCount) {
        int position = 0 < self->_uvsCount ? self->_dimension + kRGBA + kDimension2D : self->_dimension + kRGBA;
        int normalStartPointer = (position) * sizeof(GLfloat);
        glEnableVertexAttribArray(programObject.normalLocation);
        glVertexAttribPointer(programObject.normalLocation, kDimension3D, GL_FLOAT, GL_FALSE, self->_stride, BUFFER_OFFSET(normalStartPointer));
    }
    return;
}
- (void)allocateBuffer {
    GLuint bid = 0;
    glGenBuffers(1, &bid);
    glBindBuffer(GL_ARRAY_BUFFER, bid);
    int elementsCount = 0;
    int strideCount = 0;
    if (0 < self->_vertexCount) {
        strideCount += self->_dimension;
        elementsCount += self->_vertexCount;
    }
    if (0 < self->_colorsCount) {
        strideCount += kRGBA;
        elementsCount += self->_colorsCount;
    }
    if (0 < self->_uvsCount) {
        strideCount += kDimension2D;
        elementsCount += self->_uvsCount;
    }
    if (0 < self->_normalsCount) {
        strideCount += kDimension3D;
        elementsCount += self->_normalsCount;
    }
    int vidx = 0;
    int cidx = 0;
    int uvidx = 0;
    int nidx = 0;
    GLuint memsize = elementsCount * sizeof(GLfloat);
    self->_elements = (GLfloat*)malloc(memsize);
    for (int i = 0; i < elementsCount; i += strideCount) {
        if (0 < self->_vertexCount) {
            for (int idx = 0; idx < self->_dimension; idx++) {
                self->_elements[i + idx] = self->_verticies[vidx + idx];
            }
        }
        if (0 < self->_colorsCount) {
            int vboIndex = self->_dimension;
            for (int idx = 0; idx < kRGBA; idx++) {
                self->_elements[i + vboIndex + idx] = self->_colors[cidx + idx];
            }
        }
        if (0 < self->_uvsCount) {
            int vboIndex = self->_dimension + kRGBA;
            for (int idx = 0; idx < kDimension2D; idx++) {
                self->_elements[i + vboIndex + idx] = self->_uvs[uvidx + idx];
            }
        }
        if (0 < self->_normalsCount) {
            int vboIndex = 0 < self->_uvsCount ? self->_dimension + kRGBA + kDimension2D : self->_dimension + kRGBA;
            for (int idx = 0; idx < kDimension3D; idx++) {
                self->_elements[i + vboIndex + idx] = self->_normals[nidx + idx];
            }
        }
        vidx += self->_dimension;
        cidx += kRGBA;
        uvidx += kDimension2D;
        nidx += kDimension3D;
    }
    glBufferData(GL_ARRAY_BUFFER, memsize, self->_elements, GL_STATIC_DRAW);
    if (0 < self->_vertexCount) {
        glEnableVertexAttribArray(GLKVertexAttribPosition);
        glVertexAttribPointer(GLKVertexAttribPosition, self->_dimension, GL_FLOAT, GL_FALSE, sizeof(GLfloat), BUFFER_OFFSET(0));
    }
    if (0 < self->_colorsCount) {
        int colorStartPointer = self->_dimension * sizeof(GLfloat);
        glEnableVertexAttribArray(GLKVertexAttribColor);
        glVertexAttribPointer(GLKVertexAttribPosition, kRGBA, GL_FLOAT, GL_FALSE, sizeof(GLfloat), BUFFER_OFFSET(colorStartPointer));
    }
    if (0 < self->_uvsCount) {
        int uvsStartPointer = (self->_dimension + kRGBA) * sizeof(GLfloat);
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, kDimension2D, GL_FLOAT, GL_FALSE, sizeof(GLfloat), BUFFER_OFFSET(uvsStartPointer));
    }
    if (0 < self->_normalsCount) {
        int position = 0 < self->_uvsCount ? self->_dimension + kRGBA + kDimension2D : self->_dimension + kRGBA;
        int normalStartPointer = (position) * sizeof(GLfloat);
        glEnableVertexAttribArray(GLKVertexAttribNormal);
        glVertexAttribPointer(GLKVertexAttribNormal, kDimension3D, GL_FLOAT, GL_FALSE, sizeof(GLfloat), BUFFER_OFFSET(normalStartPointer));
    }
    self->_bufferId = bid;
    self->_stride = strideCount * sizeof(GLfloat);
    self->_elementsCount = elementsCount;
    self->_elementsCountPerVertex = strideCount;
    if (nil != self->_verticies) {
        free(self->_verticies);
    }
    if (nil != self->_colors) {
        free(self->_colors);
    }
    if (nil != self->_uvs) {
        free(self->_uvs);
    }
    if (nil != self->_normals) {
        free(self->_normals);
    }
    return;
}
- (void)releaseBuffer {
    if (nil != self->_elements) {
        free(self->_elements);
    }
    if (0 != self->_bufferId) {
        glDeleteBuffers(1, &self->_bufferId);
        self->_bufferId = 0;
    }
    return;
}
- (int)dimension {
    return self->_dimension;
}
- (int)count {
    return self->_count;
}
- (GLuint)stride {
    return self->_stride;
}
- (GLfloat*)elements {
    return self->_elements;
}
@end
