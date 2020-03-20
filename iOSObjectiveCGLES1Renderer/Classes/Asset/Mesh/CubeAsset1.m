// ======================================================================
// Project Name    : ios_foundation
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "CubeAsset1.h"
#import "GLES1Normal.h"
#import "GLESColor.h"
@implementation CubeAsset1
- (id)init:(GLfloat)width height:(GLfloat)height depth:(GLfloat)depth color:(GLESColor*)color {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_depth = depth;
    self->_color = color;
    self->_vertex = [[VertexArray alloc] init:3];
    return self;
}
- (void)create {
    GLfloat verticies[] = {
        // front1
        -0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        // front2
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        // back1
        -0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        // back2
        0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        // right1
        0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        // right2
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        // left1
        -0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        -0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        // left2
        -0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        // top1
        -0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        // top2
        0.5f * self->_width,
        0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        0.5f * self->_width,
        0.5f * self->_height,
        0.5f * self->_depth,
        // bottom1
        -0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        // bottom2
        0.5f * self->_width,
        -0.5f * self->_height,
        -0.5f * self->_depth,
        0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
        -0.5f * self->_width,
        -0.5f * self->_height,
        0.5f * self->_depth,
    };
    GLfloat vertexColors[] = {
        // front
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // back
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // left
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // right
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // top
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // bottom
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
    };
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int normalsLength = verticiesLength;
    int vertexColorsLength = sizeof(vertexColors) / sizeof(GLfloat);
    int vertexCount = verticiesLength / self.vertex.dimension;
    int normalsMemsize = normalsLength * sizeof(GLfloat);
    GLfloat* normals = (GLfloat*)malloc(normalsMemsize);
    for (int i = 0; i < verticiesLength; i += 9) {
        GLfloat x1 = verticies[i];
        GLfloat y1 = verticies[i + 1];
        GLfloat z1 = verticies[i + 2];
        GLfloat x2 = verticies[i + 3];
        GLfloat y2 = verticies[i + 4];
        GLfloat z2 = verticies[i + 5];
        GLfloat x3 = verticies[i + 6];
        GLfloat y3 = verticies[i + 7];
        GLfloat z3 = verticies[i + 8];
        GLKVector3 triangleNormal = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        normals[i] = triangleNormal.x;
        normals[i + 1] = triangleNormal.y;
        normals[i + 2] = triangleNormal.z;
        normals[i + 3] = triangleNormal.x;
        normals[i + 4] = triangleNormal.y;
        normals[i + 5] = triangleNormal.z;
        normals[i + 6] = triangleNormal.x;
        normals[i + 7] = triangleNormal.y;
        normals[i + 8] = triangleNormal.z;
    }
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:vertexColors vertexColorsCount:vertexColorsLength];
    [self->_vertex setNormals:normals normalsCount:normalsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return self->_vertex;
}
@end
