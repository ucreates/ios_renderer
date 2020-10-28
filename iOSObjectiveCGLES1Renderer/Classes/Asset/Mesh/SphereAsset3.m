// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "SphereAsset3.h"
#import "GLES1Angle.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
@interface SphereAsset3 ()
@end
@implementation SphereAsset3
- (id)init:(GLfloat)radius divideCount:(int)divideCount color:(GLESColor*)color {
    self = [super init];
    self->_radius = radius;
    self->_color = color;
    self->_divideCount = divideCount;
    self->_vertex = [[VertexArray alloc] init:kDimension3D];
    return self;
}
- (void)create {
    int vertexCount = (self->_divideCount - 1) * self->_divideCount * 4;
    int originVertexCount = self->_divideCount * self->_divideCount;
    int verticesLength = vertexCount * kDimension3D;
    int originVerticesLength = originVertexCount * kDimension3D;
    int colorsLength = vertexCount * kRGBA;
    int vertexNormalsLength = verticesLength;
    int surfaceNormalsLength = vertexCount;
    int verticesMemsize = verticesLength * sizeof(GLfloat);
    int originVerticesMemsize = originVerticesLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int vertexNormalsMemsize = vertexNormalsLength * sizeof(GLfloat);
    int surfaceNormalsMemsize = surfaceNormalsLength * sizeof(GLKVector3);
    GLfloat* verticies = (GLfloat*)malloc(verticesMemsize);
    GLfloat* originVerticies = (GLfloat*)malloc(originVerticesMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNormalsMemsize);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
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
            vidx += kDimension3D;
        }
    }
    vidx = 0;
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
            if (originVerticesLength == v4idx) {
                verticies[vidx] = originVerticies[v1idx];
                verticies[vidx + 1] = originVerticies[v1idx + 1];
                verticies[vidx + 2] = originVerticies[v1idx + 2];
                verticies[vidx + 3] = originVerticies[v2idx];
                verticies[vidx + 4] = originVerticies[v2idx + 1];
                verticies[vidx + 5] = originVerticies[v2idx + 2];
                verticies[vidx + 6] = originVerticies[v3idx];
                verticies[vidx + 7] = originVerticies[v3idx + 1];
                verticies[vidx + 8] = originVerticies[v3idx + 2];
                vidx += kDimension3D * 3;
            } else {
                verticies[vidx] = originVerticies[v1idx];
                verticies[vidx + 1] = originVerticies[v1idx + 1];
                verticies[vidx + 2] = originVerticies[v1idx + 2];
                verticies[vidx + 3] = originVerticies[v2idx];
                verticies[vidx + 4] = originVerticies[v2idx + 1];
                verticies[vidx + 5] = originVerticies[v2idx + 2];
                verticies[vidx + 6] = originVerticies[v3idx];
                verticies[vidx + 7] = originVerticies[v3idx + 1];
                verticies[vidx + 8] = originVerticies[v3idx + 2];
                verticies[vidx + 9] = originVerticies[v4idx];
                verticies[vidx + 10] = originVerticies[v4idx + 1];
                verticies[vidx + 11] = originVerticies[v4idx + 2];
                vidx += kDimension3D * 4;
            }
        }
    }
    int v1 = 0;
    int v2 = 1;
    int v3 = 2;
    int v4 = 3;
    for (int i = 0; i < originVertexCount; i++) {
        if (v1 == originVertexCount) {
            v1 = 0;
        }
        if (v2 == originVertexCount) {
            v2 = 0;
        }
        if (v3 == originVertexCount) {
            v3 = 0;
        }
        if (v4 == originVertexCount) {
            v4 = 0;
        }
        int vidx1 = v1 * kDimension3D;
        int vidx2 = v2 * kDimension3D;
        int vidx3 = v3 * kDimension3D;
        int vidx4 = v4 * kDimension3D;
        GLfloat x1 = verticies[vidx1];
        GLfloat y1 = verticies[vidx1 + 1];
        GLfloat z1 = verticies[vidx1 + 2];
        GLfloat x2 = verticies[vidx2];
        GLfloat y2 = verticies[vidx2 + 1];
        GLfloat z2 = verticies[vidx2 + 2];
        GLfloat x3 = verticies[vidx3];
        GLfloat y3 = verticies[vidx3 + 1];
        GLfloat z3 = verticies[vidx3 + 2];
        GLfloat x4 = verticies[vidx4];
        GLfloat y4 = verticies[vidx4 + 1];
        GLfloat z4 = verticies[vidx4 + 2];
        GLKVector3 triangleNormal1 = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        GLKVector3 triangleNormal2 = [GLES1Normal toNormal:x2 y1:y2 z1:z2 x2:x3 y2:y3 z2:z3 x3:x4 y3:y4 z3:z4];
        surfaceNormals[v1] = [GLES1Normal add:surfaceNormals[v1] vector2:triangleNormal1];
        surfaceNormals[v2] = [GLES1Normal add:surfaceNormals[v2] vector2:triangleNormal1];
        surfaceNormals[v3] = [GLES1Normal add:surfaceNormals[v3] vector2:triangleNormal1];
        surfaceNormals[v2] = [GLES1Normal add:surfaceNormals[v2] vector2:triangleNormal2];
        surfaceNormals[v3] = [GLES1Normal add:surfaceNormals[v3] vector2:triangleNormal2];
        surfaceNormals[v4] = [GLES1Normal add:surfaceNormals[v4] vector2:triangleNormal2];
        v1++;
        v2++;
        v3++;
        v4++;
    }
    int snidx = 0;
    for (int i = 0; i < vertexCount; i += kDimension3D) {
        GLKVector3 vn = [GLES1Normal toOne:surfaceNormals[snidx]];
        vertexNormals[i] = vn.x;
        vertexNormals[i + 1] = vn.y;
        vertexNormals[i + 2] = vn.z;
        snidx++;
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
    [self->_vertex setNormals:vertexNormals normalsCount:vertexNormalsLength];
    free(verticies);
    free(originVerticies);
    free(colors);
    free(vertexNormals);
    free(surfaceNormals);
    return;
}
- (void)create:(NSString*)texturePath {
    self->_texture = [[TextureAsset alloc] init];
    [self->_texture load:texturePath];
    int vertexCount = (self->_divideCount - 1) * self->_divideCount * 4;
    int originVertexCount = self->_divideCount * self->_divideCount;
    int verticesLength = vertexCount * kDimension3D;
    int uvsLength = vertexCount * kDimension2D;
    int originVerticesLength = originVertexCount * kDimension3D;
    int originUVSLength = originVertexCount * kDimension2D;
    int colorsLength = vertexCount * kRGBA;
    int vertexNormalsLength = verticesLength;
    int surfaceNormalsLength = vertexCount;
    int verticesMemsize = verticesLength * sizeof(GLfloat);
    int originVerticesMemsize = originVerticesLength * sizeof(GLfloat);
    int originUVSMemsize = originUVSLength * sizeof(GLfloat);
    int colorsMemsize = colorsLength * sizeof(GLfloat);
    int uvsMemsize = uvsLength * sizeof(GLfloat);
    int vertexNormalsMemsize = vertexNormalsLength * sizeof(GLfloat);
    int surfaceNormalsMemsize = surfaceNormalsLength * sizeof(GLKVector3);
    GLfloat* verticies = (GLfloat*)malloc(verticesMemsize);
    GLfloat* uvs = (GLfloat*)malloc(uvsMemsize);
    GLfloat* originVerticies = (GLfloat*)malloc(originVerticesMemsize);
    GLfloat* originUVs = (GLfloat*)malloc(originUVSMemsize);
    GLfloat* colors = (GLfloat*)malloc(colorsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNormalsMemsize);
    GLKVector3* surfaceNormals = (GLKVector3*)malloc(surfaceNormalsMemsize);
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
            originVerticies[vidx] = x * self->_radius;
            originVerticies[vidx + 1] = y * self->_radius;
            originVerticies[vidx + 2] = z * self->_radius;
            originUVs[uvidx] = u * self->_texture.uvRatio.width;
            originUVs[uvidx + 1] = v * v1ratio + v2ratio;
            vidx += kDimension3D;
            uvidx += kDimension2D;
        }
    }
    vidx = 0;
    int uviidx = 0;
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
            int uv1idx = v1 * kDimension2D;
            int uv2idx = v2 * kDimension2D;
            int uv3idx = v3 * kDimension2D;
            int uv4idx = v4 * kDimension2D;
            if (originVerticesLength == v4idx) {
                verticies[vidx] = originVerticies[v1idx];
                verticies[vidx + 1] = originVerticies[v1idx + 1];
                verticies[vidx + 2] = originVerticies[v1idx + 2];
                verticies[vidx + 3] = originVerticies[v2idx];
                verticies[vidx + 4] = originVerticies[v2idx + 1];
                verticies[vidx + 5] = originVerticies[v2idx + 2];
                verticies[vidx + 6] = originVerticies[v3idx];
                verticies[vidx + 7] = originVerticies[v3idx + 1];
                verticies[vidx + 8] = originVerticies[v3idx + 2];
                uvs[uviidx] = originUVs[uv1idx];
                uvs[uviidx + 1] = originUVs[uv1idx + 1];
                uvs[uviidx + 2] = originUVs[uv2idx];
                uvs[uviidx + 3] = originUVs[uv2idx + 1];
                uvs[uviidx + 4] = originUVs[uv3idx];
                uvs[uviidx + 5] = originUVs[uv3idx + 1];
                vidx += kDimension3D * 3;
                uviidx += kDimension2D * 3;
            } else {
                verticies[vidx] = originVerticies[v1idx];
                verticies[vidx + 1] = originVerticies[v1idx + 1];
                verticies[vidx + 2] = originVerticies[v1idx + 2];
                verticies[vidx + 3] = originVerticies[v2idx];
                verticies[vidx + 4] = originVerticies[v2idx + 1];
                verticies[vidx + 5] = originVerticies[v2idx + 2];
                verticies[vidx + 6] = originVerticies[v3idx];
                verticies[vidx + 7] = originVerticies[v3idx + 1];
                verticies[vidx + 8] = originVerticies[v3idx + 2];
                verticies[vidx + 9] = originVerticies[v4idx];
                verticies[vidx + 10] = originVerticies[v4idx + 1];
                verticies[vidx + 11] = originVerticies[v4idx + 2];
                uvs[uviidx] = originUVs[uv1idx];
                uvs[uviidx + 1] = originUVs[uv1idx + 1];
                uvs[uviidx + 2] = originUVs[uv2idx];
                uvs[uviidx + 3] = originUVs[uv2idx + 1];
                uvs[uviidx + 4] = originUVs[uv3idx];
                uvs[uviidx + 5] = originUVs[uv3idx + 1];
                uvs[uviidx + 6] = originUVs[uv4idx];
                uvs[uviidx + 7] = originUVs[uv4idx + 1];
                vidx += kDimension3D * 4;
                uviidx += kDimension2D * 4;
            }
        }
    }
    int v1 = 0;
    int v2 = 1;
    int v3 = 2;
    int v4 = 3;
    for (int i = 0; i < originVertexCount; i++) {
        if (v1 == originVertexCount) {
            v1 = 0;
        }
        if (v2 == originVertexCount) {
            v2 = 0;
        }
        if (v3 == originVertexCount) {
            v3 = 0;
        }
        if (v4 == originVertexCount) {
            v4 = 0;
        }
        int vidx1 = v1 * kDimension3D;
        int vidx2 = v2 * kDimension3D;
        int vidx3 = v3 * kDimension3D;
        int vidx4 = v4 * kDimension3D;
        GLfloat x1 = verticies[vidx1];
        GLfloat y1 = verticies[vidx1 + 1];
        GLfloat z1 = verticies[vidx1 + 2];
        GLfloat x2 = verticies[vidx2];
        GLfloat y2 = verticies[vidx2 + 1];
        GLfloat z2 = verticies[vidx2 + 2];
        GLfloat x3 = verticies[vidx3];
        GLfloat y3 = verticies[vidx3 + 1];
        GLfloat z3 = verticies[vidx3 + 2];
        GLfloat x4 = verticies[vidx4];
        GLfloat y4 = verticies[vidx4 + 1];
        GLfloat z4 = verticies[vidx4 + 2];
        GLKVector3 triangleNormal1 = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        GLKVector3 triangleNormal2 = [GLES1Normal toNormal:x2 y1:y2 z1:z2 x2:x3 y2:y3 z2:z3 x3:x4 y3:y4 z3:z4];
        surfaceNormals[v1] = [GLES1Normal add:surfaceNormals[v1] vector2:triangleNormal1];
        surfaceNormals[v2] = [GLES1Normal add:surfaceNormals[v2] vector2:triangleNormal1];
        surfaceNormals[v3] = [GLES1Normal add:surfaceNormals[v3] vector2:triangleNormal1];
        surfaceNormals[v2] = [GLES1Normal add:surfaceNormals[v2] vector2:triangleNormal2];
        surfaceNormals[v3] = [GLES1Normal add:surfaceNormals[v3] vector2:triangleNormal2];
        surfaceNormals[v4] = [GLES1Normal add:surfaceNormals[v4] vector2:triangleNormal2];
        v1++;
        v2++;
        v3++;
        v4++;
    }
    int snidx = 0;
    for (int i = 0; i < vertexCount; i += kDimension3D) {
        GLKVector3 vn = [GLES1Normal toOne:surfaceNormals[snidx]];
        vertexNormals[i] = vn.x;
        vertexNormals[i + 1] = vn.y;
        vertexNormals[i + 2] = vn.z;
        snidx++;
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
    [self->_vertex setNormals:vertexNormals normalsCount:vertexNormalsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    free(verticies);
    free(originVerticies);
    free(colors);
    free(originUVs);
    free(uvs);
    free(vertexNormals);
    free(surfaceNormals);
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLE_STRIP;
}
@end
