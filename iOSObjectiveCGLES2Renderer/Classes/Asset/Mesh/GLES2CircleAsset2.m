// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2CircleAsset2.h"
#import "GLES2Angle.h"
#import "GLES2Renderer.h"
@interface GLES2CircleAsset2 ()
@end
@implementation GLES2CircleAsset2
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLES2Color*)color bufferType:(int)bufferType {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[GLES2Vertex alloc] init:kDimension2D bufferType:bufferType];
    return self;
}
- (void)create {
    int vertexCount = self->_divideCount * kTriangleVertexCount;
    int verticesLength = vertexCount * kDimension2D;
    int colorsLength = vertexCount * kRGBA;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    int didx = 0;
    vertices[0] = 0.0f;
    vertices[1] = 0.0f;
    for (int i = 2; i < verticesLength; i += kRectangleVertexCount) {
        GLfloat unitDegree = (360.0 / self->_divideCount);
        GLfloat degree1 = (GLfloat)didx * unitDegree;
        GLfloat degree2 = (GLfloat)(didx + 1) * unitDegree;
        GLfloat radian1 = [GLES2Angle toRadian:degree1];
        GLfloat radian2 = [GLES2Angle toRadian:degree2];
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
    colors[0] = self->_color.r;
    colors[1] = self->_color.g;
    colors[2] = self->_color.b;
    colors[3] = self->_color.a;
    for (int i = 4; i < colorsLength; i += (kRectangleVertexCount * kRGBA)) {
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
        colors[i + 12] = self->_color.r;
        colors[i + 13] = self->_color.g;
        colors[i + 14] = self->_color.b;
        colors[i + 15] = self->_color.a;
    }
    int indiciesLength = self->_divideCount * kTriangleVertexCount;
    int indiciesMemsize = indiciesLength * sizeof(GLushort);
    GLushort* indicies = (GLushort*)malloc(indiciesMemsize);
    int currentIndex = 1;
    for (int i = 0; i < indiciesLength; i += kTriangleVertexCount) {
        indicies[i] = 0;
        indicies[i + 1] = currentIndex;
        indicies[i + 2] = currentIndex + 1;
        currentIndex += 2;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors colorsCount:colorsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    [self->_vertex allocateBuffer];
    return;
}
- (void)create:(NSString*)texturePath textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber {
    [self create:texturePath textureUnit:GL_TEXTURE0 textureUnitName:textureUnitName textureUnitNumber:textureUnitNumber];
    return;
}
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber {
    self->_texture = [[GLES2TextureAsset alloc] init];
    [self->_texture setTextureUnit:textureUnitName textureNum:textureUnitNumber];
    [self->_texture load:texturePath textureUnit:textureUnit];
    GLfloat uratio = self->_texture.uvRatio.width;
    GLfloat v1ratio = self->_texture.uvRatio.height;
    GLfloat v2ratio = 1.0f - self->_texture.uvRatio.height;
    GLfloat curatio = 0.5f * uratio;
    GLfloat cvratio = 0.5f * v1ratio + v2ratio;
    int vertexCount = self->_divideCount * kTriangleVertexCount;
    int verticesLength = vertexCount * kDimension2D;
    int colorsLength = vertexCount * kRGBA;
    int indiciesLength = vertexCount;
    int uvsLength = verticesLength;
    int vertexMemsize = verticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int indiciesMemsize = indiciesLength * sizeof(GLushort);
    int uvsMemsize = uvsLength * sizeof(GLfloat);
    GLfloat* vertices = (GLfloat*)malloc(vertexMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* uvs = (GLfloat*)malloc(uvsMemsize);
    GLushort* indicies = (GLushort*)malloc(indiciesMemsize);
    int didx = 0;
    vertices[0] = 0.0f;
    vertices[1] = 0.0f;
    uvs[0] = curatio;
    uvs[1] = cvratio;
    for (int i = 2; i < verticesLength; i += kRectangleVertexCount) {
        GLfloat unitDegree = (360.0 / self->_divideCount);
        GLfloat degree1 = (GLfloat)didx * unitDegree;
        GLfloat degree2 = (GLfloat)(didx + 1) * unitDegree;
        GLfloat radian1 = [GLES2Angle toRadian:degree1];
        GLfloat radian2 = [GLES2Angle toRadian:degree2];
        GLfloat x1 = cosf(radian1) * self->_radius;
        GLfloat y1 = sinf(radian1) * self->_radius;
        GLfloat x2 = cosf(radian2) * self->_radius;
        GLfloat y2 = sinf(radian2) * self->_radius;
        GLfloat u1 = cosf(radian1) * 0.5f;
        GLfloat v1 = sinf(radian1) * 0.5f;
        GLfloat u2 = cosf(radian2) * 0.5f;
        GLfloat v2 = sinf(radian2) * 0.5f;
        vertices[i] = x1;
        vertices[i + 1] = y1;
        vertices[i + 2] = x2;
        vertices[i + 3] = y2;
        uvs[i] = u1 * uratio + curatio;
        uvs[i + 1] = -1 * v1 * v1ratio + cvratio;
        uvs[i + 2] = u2 * uratio + curatio;
        uvs[i + 3] = -1 * v2 * v1ratio + cvratio;
        didx++;
    }
    colors[0] = self->_color.r;
    colors[1] = self->_color.g;
    colors[2] = self->_color.b;
    colors[3] = self->_color.a;
    for (int i = 4; i < colorsLength; i += (kRectangleVertexCount * kRGBA)) {
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
        colors[i + 12] = self->_color.r;
        colors[i + 13] = self->_color.g;
        colors[i + 14] = self->_color.b;
        colors[i + 15] = self->_color.a;
    }
    int currentIndex = 1;
    for (int i = 0; i < indiciesLength; i += kTriangleVertexCount) {
        indicies[i] = 0;
        indicies[i + 1] = currentIndex;
        indicies[i + 2] = currentIndex + 1;
        currentIndex += 2;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors colorsCount:colorsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    [self->_vertex allocateBuffer];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
@end
