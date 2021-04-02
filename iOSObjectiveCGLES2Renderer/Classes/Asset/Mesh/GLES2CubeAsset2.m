// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2CubeAsset2.h"
#import "GLES2Color.h"
#import "GLES2Normal.h"
#import "GLES2Renderer.h"
@implementation GLES2CubeAsset2
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLES2Color*)color bufferType:(int)bufferType {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_depth = depth;
    self->_color = color;
    self->_vertex = [[GLES2Vertex alloc] init:kDimension3D bufferType:bufferType];
    return self;
}
- (void)create {
    GLfloat x = 0.5f * self->_width;
    GLfloat y = 0.5f * self->_height;
    GLfloat z = 0.5f * self->_depth;
    GLfloat verticies[] = {
        // left up front
        -x,
        y,
        -z,
        // right up front
        x,
        y,
        -z,
        // left down front
        -x,
        -y,
        -z,
        // right down front
        x,
        -y,
        -z,
        // left up back
        -x,
        y,
        z,
        // right up back
        x,
        y,
        z,
        // left down back
        -x,
        -y,
        z,
        // right down back
        x,
        -y,
        z,
    };
    GLfloat colors[] = {
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
    };
    GLushort indicies[] = {
        // front
        0, 1, 2, 2, 1, 3,
        // back
        4, 6, 5, 5, 6, 7,
        // right
        1, 5, 3, 3, 5, 7,
        // left
        0, 2, 4, 4, 2, 6,
        // top
        0, 4, 1, 1, 4, 5,
        // bottom
        2, 3, 6, 6, 3, 7};
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int normalsLength = verticiesLength;
    int indiciesLength = sizeof(indicies) / sizeof(GLushort);
    int vertexCount = verticiesLength / kDimension3D;
    int surfaceNormalsMemsize = vertexCount * sizeof(GLKVector3);
    int vertexNormalsMemsize = normalsLength * sizeof(GLKVector3);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNormalsMemsize);
    int i1 = 0;
    int i2 = 1;
    int i3 = 2;
    int indiciesCount = indiciesLength - 1;
    for (int i = 0; i < indiciesLength; i++) {
        if (i1 > indiciesCount) {
            i1 = 0;
        }
        if (i2 > indiciesCount) {
            i2 = 0;
        }
        if (i3 > indiciesCount) {
            i3 = 0;
        }
        int idx1 = indicies[i1];
        int idx2 = indicies[i2];
        int idx3 = indicies[i3];
        int v1idx = idx1 * kDimension3D;
        int v2idx = idx2 * kDimension3D;
        int v3idx = idx3 * kDimension3D;
        GLfloat x1 = verticies[v1idx];
        GLfloat y1 = verticies[v1idx + 1];
        GLfloat z1 = verticies[v1idx + 2];
        GLfloat x2 = verticies[v2idx];
        GLfloat y2 = verticies[v2idx + 1];
        GLfloat z2 = verticies[v2idx + 2];
        GLfloat x3 = verticies[v3idx];
        GLfloat y3 = verticies[v3idx + 1];
        GLfloat z3 = verticies[v3idx + 2];
        GLKVector3 surfaceNormal1 = surfaceNormals[idx1];
        GLKVector3 surfaceNormal2 = surfaceNormals[idx2];
        GLKVector3 surfaceNormal3 = surfaceNormals[idx3];
        GLKVector3 triangleNormal = [GLES2Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        surfaceNormals[idx1] = GLKVector3Add(surfaceNormal1, triangleNormal);
        surfaceNormals[idx2] = GLKVector3Add(surfaceNormal2, triangleNormal);
        surfaceNormals[idx3] = GLKVector3Add(surfaceNormal3, triangleNormal);
        i1++;
        i2++;
        i3++;
    }
    int vnidx = 0;
    for (int i = 0; i < vertexCount; i++) {
        GLKVector3 surfaceNormal = [GLES2Normal toOne:surfaceNormals[i]];
        vertexNormals[vnidx] = surfaceNormal.x;
        vertexNormals[vnidx + 1] = surfaceNormal.y;
        vertexNormals[vnidx + 2] = surfaceNormal.z;
        vnidx += kDimension3D;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:colors colorsCount:colorsLength];
    [self->_vertex setNormals:vertexNormals normalsCount:normalsLength];
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
    GLfloat u2 = self->_texture.uvRatio.width;
    GLfloat v1 = 1.0f - self->_texture.uvRatio.height;
    GLfloat x = 0.5f * self->_width;
    GLfloat y = 0.5f * self->_height;
    GLfloat z = 0.5f * self->_depth;
    GLfloat verticies[] = {
        // front
        -x,
        y,
        -z,
        x,
        y,
        -z,
        -x,
        -y,
        -z,
        x,
        -y,
        -z,
        // back
        -x,
        y,
        z,
        x,
        y,
        z,
        -x,
        -y,
        z,
        x,
        -y,
        z,
        // right
        x,
        y,
        z,
        x,
        y,
        -z,
        x,
        -y,
        z,
        x,
        -y,
        -z,
        // left
        -x,
        y,
        z,
        -x,
        y,
        -z,
        -x,
        -y,
        z,
        -x,
        -y,
        -z,
        // top
        -x,
        y,
        -z,
        x,
        y,
        -z,
        -x,
        y,
        z,
        x,
        y,
        z,
        // bottom
        -x,
        -y,
        -z,
        x,
        -y,
        -z,
        -x,
        -y,
        z,
        x,
        -y,
        z,
    };
    GLfloat colors[] = {
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
    };
    GLfloat uvs[] = {
        // front
        u2,
        v1,
        0.0f,
        v1,
        u2,
        1.0f,
        0.0f,
        1.0f,
        // back
        0.0f,
        v1,
        u2,
        v1,
        0.0f,
        1.0f,
        u2,
        1.0f,
        // right
        0.0f,
        v1,
        u2,
        v1,
        0.0f,
        1.0f,
        u2,
        1.0f,
        // left
        u2,
        v1,
        0.0f,
        v1,
        u2,
        1.0f,
        0.0f,
        1.0f,
        // top
        0.0f,
        v1,
        u2,
        v1,
        0.0f,
        1.0f,
        u2,
        1.0f,
        // bottom
        u2,
        v1,
        0.0f,
        v1,
        u2,
        1.0f,
        0.0f,
        1.0f,
    };
    GLushort indicies[] = {0, 1, 2, 2, 1, 3,
                           // back
                           4, 6, 5, 5, 6, 7,
                           // right
                           8, 10, 9, 9, 10, 11,
                           // left
                           12, 13, 14, 14, 13, 15,
                           // top
                           16, 18, 17, 17, 18, 19,
                           // bottom
                           20, 21, 22, 22, 21, 23};
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int normalsLength = verticiesLength;
    int uvsLength = sizeof(uvs) / sizeof(GLfloat);
    int indiciesLength = sizeof(indicies) / sizeof(GLushort);
    int vertexCount = indiciesLength;
    int surfaceNormalsMemsize = vertexCount * sizeof(GLKVector3);
    int vertexNormalsMemsize = normalsLength * sizeof(GLKVector3);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNormalsMemsize);
    int i1 = 0;
    int i2 = 1;
    int i3 = 2;
    int indiciesCount = indiciesLength - 1;
    for (int i = 0; i < indiciesLength; i++) {
        if (i1 > indiciesCount) {
            i1 = 0;
        }
        if (i2 > indiciesCount) {
            i2 = 0;
        }
        if (i3 > indiciesCount) {
            i3 = 0;
        }
        int idx1 = indicies[i1];
        int idx2 = indicies[i2];
        int idx3 = indicies[i3];
        int v1idx = idx1 * kDimension3D;
        int v2idx = idx2 * kDimension3D;
        int v3idx = idx3 * kDimension3D;
        GLfloat x1 = verticies[v1idx];
        GLfloat y1 = verticies[v1idx + 1];
        GLfloat z1 = verticies[v1idx + 2];
        GLfloat x2 = verticies[v2idx];
        GLfloat y2 = verticies[v2idx + 1];
        GLfloat z2 = verticies[v2idx + 2];
        GLfloat x3 = verticies[v3idx];
        GLfloat y3 = verticies[v3idx + 1];
        GLfloat z3 = verticies[v3idx + 2];
        GLKVector3 surfaceNormal1 = surfaceNormals[idx1];
        GLKVector3 surfaceNormal2 = surfaceNormals[idx2];
        GLKVector3 surfaceNormal3 = surfaceNormals[idx3];
        GLKVector3 triangleNormal = [GLES2Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        surfaceNormals[idx1] = GLKVector3Add(surfaceNormal1, triangleNormal);
        surfaceNormals[idx2] = GLKVector3Add(surfaceNormal2, triangleNormal);
        surfaceNormals[idx3] = GLKVector3Add(surfaceNormal3, triangleNormal);
        i1++;
        i2++;
        i3++;
    }
    int vnidx = 0;
    for (int i = 0; i < vertexCount; i++) {
        GLKVector3 surfaceNormal = [GLES2Normal toOne:surfaceNormals[i]];
        vertexNormals[vnidx] = surfaceNormal.x;
        vertexNormals[vnidx + 1] = surfaceNormal.y;
        vertexNormals[vnidx + 2] = surfaceNormal.z;
        vnidx += kDimension3D;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:colors colorsCount:colorsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    [self->_vertex setNormals:vertexNormals normalsCount:normalsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    [self->_vertex allocateBuffer];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
@end
