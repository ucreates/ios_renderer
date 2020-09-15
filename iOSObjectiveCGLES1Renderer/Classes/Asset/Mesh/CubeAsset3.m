// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "CubeAsset3.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
#import "GLESColor.h"
@implementation CubeAsset3
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
        -x, y, -z,
        // 2:RTF
        x, y, -z,
        // 3:LBF
        -x, -y, -z,
        // 4:RBF
        x, -y, -z,
        // 5:RBR
        x, -y, z,
        // 6:RTF
        x, y, -z,
        // 7:RTR
        x, y, z,
        // 8:LTF
        -x, y, -z,
        // 9:LTR
        -x, y, z,
        // 10:LBF
        -x, -y, -z,
        // 11:LBR
        -x, -y, z,
        // 12:RBR
        x, -y, z,
        // 13:LTR
        -x, y, z,
        // 14:RTR
        x, y, z};
    GLfloat colors[] = {
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
        self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a, self->_color.r, self->_color.g, self->_color.b, self->_color.a,
    };
    int verticiesLength = sizeof(verticies) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int vertexCount = verticiesLength / kDimension3D;
    int normalsLength = verticiesLength;
    int normalsMemsize = normalsLength * sizeof(GLKVector3);
    GLKVector3* vertexNormals = (GLKVector3*)malloc(normalsMemsize);
    int n1idx = 0;
    int n2idx = 1;
    int n3idx = 2;
    for (int i = 0; i < normalsLength; i++) {
        int v1idx = n1idx * kDimension3D;
        int v2idx = n2idx * kDimension3D;
        int v3idx = n3idx * kDimension3D;
        GLfloat x1 = verticies[v1idx];
        GLfloat y1 = verticies[v1idx + 1];
        GLfloat z1 = verticies[v1idx + 2];
        GLfloat x2 = verticies[v2idx];
        GLfloat y2 = verticies[v2idx + 1];
        GLfloat z2 = verticies[v2idx + 2];
        GLfloat x3 = verticies[v3idx];
        GLfloat y3 = verticies[v3idx + 1];
        GLfloat z3 = verticies[v3idx + 2];
        GLKVector3 triangleNormal;
        if (0 == i % 2) {
            triangleNormal = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x2 y2:y2 z2:z2 x3:x3 y3:y3 z3:z3];
        } else {
            triangleNormal = [GLES1Normal toNormal:x1 y1:y1 z1:z1 x2:x3 y2:y3 z2:z3 x3:x2 y3:y2 z3:z2];
        }
        vertexNormals[n1idx] = [GLES1Normal add:vertexNormals[n1idx] vector2:triangleNormal];
        vertexNormals[n2idx] = [GLES1Normal add:vertexNormals[n2idx] vector2:triangleNormal];
        vertexNormals[n3idx] = [GLES1Normal add:vertexNormals[n3idx] vector2:triangleNormal];
        vertexNormals[n1idx] = [GLES1Normal toOne:vertexNormals[n1idx]];
        vertexNormals[n2idx] = [GLES1Normal toOne:vertexNormals[n2idx]];
        vertexNormals[n3idx] = [GLES1Normal toOne:vertexNormals[n3idx]];
        n1idx++;
        n2idx++;
        n3idx++;
        if (normalsLength == n1idx) {
            n1idx = 0;
        }
        if (normalsLength == n2idx) {
            n2idx = 0;
        }
        if (normalsLength == n3idx) {
            n3idx = 0;
        }
    }
    GLKVector3 vn4 = vertexNormals[3];
    GLKVector3 vn11 = vertexNormals[10];
    GLKVector3 vn18 = [GLES1Normal add:vertexNormals[0] vector2:vertexNormals[7]];
    GLKVector3 vn26 = [GLES1Normal add:vertexNormals[1] vector2:vertexNormals[5]];
    GLKVector3 vn310 = [GLES1Normal add:vertexNormals[2] vector2:vertexNormals[9]];
    GLKVector3 vn512 = [GLES1Normal add:vertexNormals[4] vector2:vertexNormals[11]];
    GLKVector3 vn913 = [GLES1Normal add:vertexNormals[8] vector2:vertexNormals[12]];
    GLKVector3 vn714 = [GLES1Normal add:vertexNormals[6] vector2:vertexNormals[13]];
    vn4 = [GLES1Normal toOne:vn4];
    vn11 = [GLES1Normal toOne:vn11];
    vn18 = [GLES1Normal toOne:vn18];
    vn26 = [GLES1Normal toOne:vn26];
    vn310 = [GLES1Normal toOne:vn310];
    vn512 = [GLES1Normal toOne:vn512];
    vn913 = [GLES1Normal toOne:vn913];
    vn714 = [GLES1Normal toOne:vn714];
    GLfloat normals[] = {
        vn18.x, vn18.y, vn18.z, vn26.x, vn26.y, vn26.z, vn310.x, vn310.y, vn310.z, vn4.x, vn4.y, vn4.z, vn512.x, vn512.y, vn512.z, vn26.x, vn26.y, vn26.z, vn714.x, vn714.y, vn714.z, vn18.x, vn18.y, vn18.z, vn913.x, vn913.y, vn913.z, vn310.x, vn310.y, vn310.z, vn11.x, vn11.y, vn11.z, vn512.x, vn512.y, vn512.z, vn913.x, vn913.y, vn913.z, vn714.x, vn714.y, vn714.z,
    };
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:verticies verticiesCount:verticiesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setNormals:normals normalsCount:normalsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLE_STRIP;
}
@end
