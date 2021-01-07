// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1SphereAsset2.h"
#import "GLES1Angle.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
@interface GLES1SphereAsset2 ()
@end
@implementation GLES1SphereAsset2
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLES1Color*)color {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[GLES1VertexArray alloc] init:kDimension3D];
    return self;
}
- (void)create {
    int vertexCount = (self->_divideCount - 1) * self->_divideCount * 2 * kDimension3D;
    int verticesLength = self->_divideCount * self->_divideCount * kDimension3D;
    int colorsLength = vertexCount * kRGBA;
    int normalsLength = verticesLength;
    int surfaceNormalsLength = self->_divideCount * self->_divideCount;
    int indiciesLength = vertexCount;
    int verticesMemsize = verticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int normalsMemsize = normalsLength * sizeof(GLfloat);
    int surfaceNormalsMemsize = surfaceNormalsLength * sizeof(GLKVector3);
    int indiciesMemsize = indiciesLength * sizeof(GLushort);
    GLfloat* verticies = (GLfloat*)malloc(verticesMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* normals = (GLfloat*)malloc(normalsMemsize);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
    GLushort* indicies = (GLushort*)malloc(indiciesMemsize);
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
            verticies[vidx] = x * self->_radius;
            verticies[vidx + 1] = y * self->_radius;
            verticies[vidx + 2] = z * self->_radius;
            vidx += kDimension3D;
        }
    }
    int iidx = 0;
    for (int j = 0; j < self->_divideCount - 1; ++j) {
        int stack = j * self->_divideCount;
        for (int i = 0; i < self->_divideCount; ++i) {
            int v1 = stack + i;
            int v2 = stack + i + 1;
            int v3 = stack + i + self->_divideCount;
            int v4 = stack + i + self->_divideCount + 1;
            int v1idx = v1 * kDimension3D;
            int v2idx = v2 * kDimension3D;
            int v3idx = v3 * kDimension3D;
            int v4idx = v4 * kDimension3D;
            indicies[iidx] = v1;
            indicies[iidx + 1] = v2;
            indicies[iidx + 2] = v3;
            indicies[iidx + 3] = v3;
            indicies[iidx + 4] = v2;
            indicies[iidx + 5] = v4;
            GLfloat x1 = verticies[v1idx];
            GLfloat y1 = verticies[v1idx + 1];
            GLfloat z1 = verticies[v1idx + 2];
            GLfloat x2 = verticies[v2idx];
            GLfloat y2 = verticies[v2idx + 1];
            GLfloat z2 = verticies[v2idx + 2];
            GLfloat x3 = verticies[v3idx];
            GLfloat y3 = verticies[v3idx + 1];
            GLfloat z3 = verticies[v3idx + 2];
            GLfloat x4 = verticies[v3idx];
            GLfloat y4 = verticies[v3idx + 1];
            GLfloat z4 = verticies[v3idx + 2];
            GLfloat x5 = verticies[v2idx];
            GLfloat y5 = verticies[v2idx + 1];
            GLfloat z5 = verticies[v2idx + 2];
            GLfloat x6 = verticies[v4idx];
            GLfloat y6 = verticies[v4idx + 1];
            GLfloat z6 = verticies[v4idx + 2];
            GLKVector3 surfaceNormal1 = surfaceNormals[v1];
            GLKVector3 surfaceNormal2 = surfaceNormals[v1];
            GLKVector3 surfaceNormal3 = surfaceNormals[v3];
            GLKVector3 surfaceNormal4 = surfaceNormals[v4];
            GLKVector3 triangleNormal1 = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
            GLKVector3 triangleNormal2 = [GLES1Normal toNormal:x4 y1:y4 z1:z4 x2:x5 y2:y5 z2:z5 x3:x6 y3:y6 z3:z6];
            surfaceNormals[v1] = GLKVector3Add(surfaceNormal1, triangleNormal1);
            surfaceNormals[v2] = GLKVector3Add(surfaceNormal2, triangleNormal1);
            surfaceNormals[v3] = GLKVector3Add(surfaceNormal3, triangleNormal1);
            surfaceNormals[v3] = GLKVector3Add(surfaceNormal3, triangleNormal2);
            surfaceNormals[v2] = GLKVector3Add(surfaceNormal2, triangleNormal2);
            surfaceNormals[v4] = GLKVector3Add(surfaceNormal4, triangleNormal2);
            iidx += 6;
        }
    }
    int nidx = 0;
    for (int i = 0; i < surfaceNormalsLength; i++) {
        GLKVector3 vn = surfaceNormals[i];
        normals[nidx] = vn.x;
        normals[nidx + 1] = vn.y;
        normals[nidx + 2] = vn.z;
        nidx += kDimension3D;
    }
    for (int i = 0; i < colorsLength; i += kRGBA) {
        colors[i] = self->_color.r;
        colors[i + 1] = self->_color.g;
        colors[i + 2] = self->_color.b;
        colors[i + 3] = self->_color.a;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setNormals:normals normalsCount:normalsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    free(verticies);
    free(colors);
    free(normals);
    free(surfaceNormals);
    free(indicies);
    return;
}
- (void)create:(NSString*)texturePath {
    self->_texture = [[GLES1TextureAsset alloc] init];
    [self->_texture load:texturePath];
    int vertexCount = (self->_divideCount - 1) * self->_divideCount * 2 * kDimension3D;
    int verticesLength = self->_divideCount * self->_divideCount * kDimension3D;
    int colorsLength = vertexCount * kRGBA;
    int uvsLength = self->_divideCount * self->_divideCount * kDimension2D;
    int normalsLength = verticesLength;
    int surfaceNormalsLength = self->_divideCount * self->_divideCount;
    int indiciesLength = vertexCount;
    int verticesMemsize = verticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int uvsMemsize = uvsLength * sizeof(GLfloat);
    int normalsMemsize = normalsLength * sizeof(GLfloat);
    int surfaceNormalsMemsize = surfaceNormalsLength * sizeof(GLKVector3);
    int indiciesMemsize = indiciesLength * sizeof(GLushort);
    GLfloat* verticies = (GLfloat*)malloc(verticesMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* uvs = (GLfloat*)malloc(uvsMemsize);
    GLfloat* normals = (GLfloat*)malloc(normalsMemsize);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
    GLushort* indicies = (GLushort*)malloc(indiciesMemsize);
    int vidx = 0;
    int uvidx = 0;
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
            GLfloat v1ratio = self->_texture.uvRatio.height;
            GLfloat v2ratio = 1.0f - self->_texture.uvRatio.height;
            verticies[vidx] = x * self->_radius;
            verticies[vidx + 1] = y * self->_radius;
            verticies[vidx + 2] = z * self->_radius;
            uvs[uvidx] = u * self->_texture.uvRatio.width;
            uvs[uvidx + 1] = v * v1ratio + v2ratio;
            vidx += kDimension3D;
            uvidx += kDimension2D;
        }
    }
    int iidx = 0;
    for (int j = 0; j < self->_divideCount - 1; ++j) {
        int stack = j * self->_divideCount;
        for (int i = 0; i < self->_divideCount; ++i) {
            int v1 = stack + i;
            int v2 = stack + i + 1;
            int v3 = stack + i + self->_divideCount;
            int v4 = stack + i + self->_divideCount + 1;
            int v1idx = v1 * kDimension3D;
            int v2idx = v2 * kDimension3D;
            int v3idx = v3 * kDimension3D;
            int v4idx = v4 * kDimension3D;
            indicies[iidx] = v1;
            indicies[iidx + 1] = v2;
            indicies[iidx + 2] = v3;
            indicies[iidx + 3] = v3;
            indicies[iidx + 4] = v2;
            indicies[iidx + 5] = v4;
            GLfloat x1 = verticies[v1idx];
            GLfloat y1 = verticies[v1idx + 1];
            GLfloat z1 = verticies[v1idx + 2];
            GLfloat x2 = verticies[v2idx];
            GLfloat y2 = verticies[v2idx + 1];
            GLfloat z2 = verticies[v2idx + 2];
            GLfloat x3 = verticies[v3idx];
            GLfloat y3 = verticies[v3idx + 1];
            GLfloat z3 = verticies[v3idx + 2];
            GLfloat x4 = verticies[v3idx];
            GLfloat y4 = verticies[v3idx + 1];
            GLfloat z4 = verticies[v3idx + 2];
            GLfloat x5 = verticies[v2idx];
            GLfloat y5 = verticies[v2idx + 1];
            GLfloat z5 = verticies[v2idx + 2];
            GLfloat x6 = verticies[v4idx];
            GLfloat y6 = verticies[v4idx + 1];
            GLfloat z6 = verticies[v4idx + 2];
            GLKVector3 surfaceNormal1 = surfaceNormals[v1];
            GLKVector3 surfaceNormal2 = surfaceNormals[v1];
            GLKVector3 surfaceNormal3 = surfaceNormals[v3];
            GLKVector3 surfaceNormal4 = surfaceNormals[v4];
            GLKVector3 triangleNormal1 = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
            GLKVector3 triangleNormal2 = [GLES1Normal toNormal:x4 y1:y4 z1:z4 x2:x5 y2:y5 z2:z5 x3:x6 y3:y6 z3:z6];
            surfaceNormals[v1] = GLKVector3Add(surfaceNormal1, triangleNormal1);
            surfaceNormals[v2] = GLKVector3Add(surfaceNormal2, triangleNormal1);
            surfaceNormals[v3] = GLKVector3Add(surfaceNormal3, triangleNormal1);
            surfaceNormals[v3] = GLKVector3Add(surfaceNormal3, triangleNormal2);
            surfaceNormals[v2] = GLKVector3Add(surfaceNormal2, triangleNormal2);
            surfaceNormals[v4] = GLKVector3Add(surfaceNormal4, triangleNormal2);
            iidx += 6;
        }
    }
    int nidx = 0;
    for (int i = 0; i < surfaceNormalsLength; i++) {
        GLKVector3 vn = surfaceNormals[i];
        normals[nidx] = vn.x;
        normals[nidx + 1] = vn.y;
        normals[nidx + 2] = vn.z;
        nidx += kDimension3D;
    }
    for (int i = 0; i < colorsLength; i += kRGBA) {
        colors[i] = self->_color.r;
        colors[i + 1] = self->_color.g;
        colors[i + 2] = self->_color.b;
        colors[i + 3] = self->_color.a;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    [self->_vertex setNormals:normals normalsCount:normalsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    free(verticies);
    free(colors);
    free(uvs);
    free(normals);
    free(surfaceNormals);
    free(indicies);
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
@end
