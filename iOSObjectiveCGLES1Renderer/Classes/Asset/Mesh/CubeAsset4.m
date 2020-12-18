// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "CubeAsset4.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
#import "GLESColor.h"
@implementation CubeAsset4
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLESColor*)color {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_depth = depth;
    self->_color = color;
    self->_vertex = [[VertexArray alloc] init:kDimension3D];
    return self;
}
- (void)create {
    GLfloat x = 0.5f * self->_width;
    GLfloat y = 0.5f * self->_height;
    GLfloat z = 0.5f * self->_depth;
    GLfloat verticies[] = {
        // 1:LTF
        -x,
        y,
        -z,
        // 2:RTF
        x,
        y,
        -z,
        // 3:LBF
        -x,
        -y,
        -z,
        // 4:RBF
        x,
        -y,
        -z,
        // 5:RBR
        x,
        -y,
        z,
        // 6:RTF
        x,
        y,
        -z,
        // 7:RTR
        x,
        y,
        z,
        // 8:LTF
        -x,
        y,
        -z,
        // 9:LTR
        -x,
        y,
        z,
        // 10:LBF
        -x,
        -y,
        -z,
        // 11:LBR
        -x,
        -y,
        z,
        // 12:RBR
        x,
        -y,
        z,
        // 13:LTR
        -x,
        y,
        z,
        // 14:RTR
        x,
        y,
        z,
    };
    GLfloat colors[] = {
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
    };
    GLushort indicies[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int normalsLength = verticiesLength;
    int surfaceNomalsMemsize = normalsLength * sizeof(GLKVector3);
    int vertexNomalsMemsize = normalsLength * sizeof(GLfloat);
    int indiciesLength = sizeof(indicies) / sizeof(GLushort);
    int vertexCount = indiciesLength;
    GLKVector3* surfaceNomals = (GLKVector3*)malloc(surfaceNomalsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNomalsMemsize);
    int vnidx = 0;
    int iidx1 = 0;
    int iidx2 = 1;
    int iidx3 = 2;
    for (int i = 0; i < indiciesLength; i += kDimension3D) {
        if (indiciesLength == iidx1) {
            iidx1 = 0;
        }
        if (indiciesLength == iidx2) {
            iidx2 = 0;
        }
        if (indiciesLength == iidx3) {
            iidx3 = 0;
        }
        int idx1 = indicies[iidx1];
        int idx2 = indicies[iidx2];
        int idx3 = indicies[iidx3];
        int vidx1 = idx1 * kDimension3D;
        int vidx2 = idx2 * kDimension3D;
        int vidx3 = idx3 * kDimension3D;
        GLfloat x1 = verticies[vidx1];
        GLfloat y1 = verticies[vidx1 + 1];
        GLfloat z1 = verticies[vidx1 + 2];
        GLfloat x2 = verticies[vidx2];
        GLfloat y2 = verticies[vidx2 + 1];
        GLfloat z2 = verticies[vidx2 + 2];
        GLfloat x3 = verticies[vidx3];
        GLfloat y3 = verticies[vidx3 + 1];
        GLfloat z3 = verticies[vidx3 + 2];
        GLKVector3 triangleNormal = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        surfaceNomals[idx1] = GLKVector3Add(surfaceNomals[idx1], triangleNormal);
        surfaceNomals[idx2] = GLKVector3Add(surfaceNomals[idx2], triangleNormal);
        surfaceNomals[idx3] = GLKVector3Add(surfaceNomals[idx3], triangleNormal);
        vnidx++;
        iidx1++;
        iidx2++;
        iidx3++;
    }
    vnidx = 0;
    int surfaceNomalsLength = sizeof(normalsLength) / sizeof(GLKVector3);
    for (int i = 0; i < surfaceNomalsLength; i++) {
        GLKVector3 surfaceNormal = [GLES1Normal toOne:surfaceNomals[i]];
        vertexNormals[vnidx] = surfaceNormal.x;
        vertexNormals[vnidx + 1] = surfaceNormal.y;
        vertexNormals[vnidx + 2] = surfaceNormal.z;
        vnidx += kDimension3D;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setNormals:vertexNormals normalsCount:normalsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    return;
}
- (void)create:(NSString*)texturePath {
    self->_texture = [[TextureAsset alloc] init];
    [self->_texture load:texturePath];
    GLfloat u2 = self->_texture.uvRatio.width;
    GLfloat v1 = 1.0f - self->_texture.uvRatio.height;
    GLfloat x = 0.5f * self->_width;
    GLfloat y = 0.5f * self->_height;
    GLfloat z = 0.5f * self->_depth;
    GLfloat verticies[] = {
        // 1:LTF
        -x,
        y,
        -z,
        // 2:RTF
        x,
        y,
        -z,
        // 3:LBF
        -x,
        -y,
        -z,
        // 4:RBF
        x,
        -y,
        -z,
        // 5:RBR
        x,
        -y,
        z,
        // 6:RTF
        x,
        y,
        -z,
        // 7:RTR
        x,
        y,
        z,
        // 8:LTF
        -x,
        y,
        -z,
        // 9:LTR
        -x,
        y,
        z,
        // 10:LBF
        -x,
        -y,
        -z,
        // 11:LBR
        -x,
        -y,
        z,
        // 12:RBR
        x,
        -y,
        z,
        // 13:LTR
        -x,
        y,
        z,
        // 14:RTR
        x,
        y,
        z,
    };
    GLfloat colors[] = {
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
    };
    GLfloat uvs[] = {0.0f, v1, u2, v1, 0.0f, 1.0f, u2, 1.0f, u2, v1, 0.0f, 1.0f, 0.0f, v1, u2, 1.0f, u2, v1, 0.0f, 1.0f, 0.0f, v1, u2, v1, 0.0f, 1.0f, u2, 1.0f};
    GLushort indicies[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int uvsLength = sizeof(uvs) / sizeof(GLfloat);
    int normalsLength = verticiesLength;
    int surfaceNomalsMemsize = normalsLength * sizeof(GLKVector3);
    int vertexNomalsMemsize = normalsLength * sizeof(GLfloat);
    int indiciesLength = sizeof(indicies) / sizeof(GLushort);
    int vertexCount = indiciesLength;
    GLKVector3* surfaceNomals = (GLKVector3*)malloc(surfaceNomalsMemsize);
    GLfloat* vertexNormals = (GLfloat*)malloc(vertexNomalsMemsize);
    int vnidx = 0;
    int iidx1 = 0;
    int iidx2 = 1;
    int iidx3 = 2;
    for (int i = 0; i < indiciesLength; i += kDimension3D) {
        if (indiciesLength == iidx1) {
            iidx1 = 0;
        }
        if (indiciesLength == iidx2) {
            iidx2 = 0;
        }
        if (indiciesLength == iidx3) {
            iidx3 = 0;
        }
        int idx1 = indicies[iidx1];
        int idx2 = indicies[iidx2];
        int idx3 = indicies[iidx3];
        int vidx1 = idx1 * kDimension3D;
        int vidx2 = idx2 * kDimension3D;
        int vidx3 = idx3 * kDimension3D;
        GLfloat x1 = verticies[vidx1];
        GLfloat y1 = verticies[vidx1 + 1];
        GLfloat z1 = verticies[vidx1 + 2];
        GLfloat x2 = verticies[vidx2];
        GLfloat y2 = verticies[vidx2 + 1];
        GLfloat z2 = verticies[vidx2 + 2];
        GLfloat x3 = verticies[vidx3];
        GLfloat y3 = verticies[vidx3 + 1];
        GLfloat z3 = verticies[vidx3 + 2];
        GLKVector3 triangleNormal = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        surfaceNomals[idx1] = GLKVector3Add(surfaceNomals[idx1], triangleNormal);
        surfaceNomals[idx2] = GLKVector3Add(surfaceNomals[idx2], triangleNormal);
        surfaceNomals[idx3] = GLKVector3Add(surfaceNomals[idx3], triangleNormal);
        vnidx++;
        iidx1++;
        iidx2++;
        iidx3++;
    }
    vnidx = 0;
    int surfaceNomalsLength = sizeof(normalsLength) / sizeof(GLKVector3);
    for (int i = 0; i < surfaceNomalsLength; i++) {
        GLKVector3 surfaceNormal = [GLES1Normal toOne:surfaceNomals[i]];
        vertexNormals[vnidx] = surfaceNormal.x;
        vertexNormals[vnidx + 1] = surfaceNormal.y;
        vertexNormals[vnidx + 2] = surfaceNormal.z;
        vnidx += kDimension3D;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    [self->_vertex setNormals:vertexNormals normalsCount:normalsLength];
    [self->_vertex setIndicies:indicies indiciesCount:indiciesLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLE_STRIP;
}
@end
