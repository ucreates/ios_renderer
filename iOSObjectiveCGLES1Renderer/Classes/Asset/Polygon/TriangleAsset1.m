// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TriangleAsset1.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface TriangleAsset1 ()
@end
@implementation TriangleAsset1
- (id)init:(GLfloat)width height:(GLfloat)height color:(GLESColor*)color {
    self = [super init];
    self->_width = width;
    self->_height = height;
    self->_color = color;
    self->_vertex = [[VertexArray alloc] init:2];
    return self;
}
- (void)create {
    GLfloat vertices[] = {
        // left down
        -0.5f * self->_width,
        -0.5f * self->_height,
        // right down
        0.5f * self->_width,
        -0.5f * self->_height,
        // center top
        0.0f,
        0.5f * self->_height,
    };
    GLfloat colors[] = {
        // left down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // right down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // center top
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
    };
    int verticesLength = sizeof(vertices) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int vertexCount = verticesLength / self.vertex.dimension;
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    return;
}
- (void)create:(NSString*)texturePath {
    [self create:texturePath textureUnit:GL_TEXTURE0];
    return;
}
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit {
    self->_texture = [[TextureAsset alloc] init];
    [self->_texture load:texturePath textureUnit:textureUnit];
    GLfloat vratio = 1.0f - self->_texture.uvRatio.height;
    GLfloat x = self->_width;
    GLfloat y = self->_height;
    GLfloat vertices[] = {
        // left down
        -x,
        -y,
        // right down
        x,
        -y,
        // center top
        0.0f,
        y,
    };
    GLfloat colors[] = {
        // left down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // right down
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
        // center top
        self->_color.r,
        self->_color.g,
        self->_color.b,
        self->_color.a,
    };
    GLfloat uvs[] = {
        // left down
        0.0f,
        1.0f,
        // right down
        1.0f * self->_texture.uvRatio.width,
        1.0f,
        // center top
        0.5f,
        0.0f + vratio,
    };
    int verticesLength = sizeof(vertices) / sizeof(GLfloat);
    int colorsLength = sizeof(colors) / sizeof(GLfloat);
    int uvsLength = sizeof(uvs) / sizeof(GLfloat);
    int vertexCount = verticesLength / self.vertex.dimension;
    [self->_vertex setVertexCount:vertexCount];
    [self->_vertex setVerticies:vertices verticiesCount:verticesLength];
    [self->_vertex setColors:colors vertexColorsCount:colorsLength];
    [self->_vertex setUVs:uvs uvsCount:uvsLength];
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return self->_vertex;
}
@end
