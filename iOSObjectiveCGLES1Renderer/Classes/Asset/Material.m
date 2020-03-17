// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Material.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
@implementation Material
- (id)init {
    self->_ambient = nil;
    self->_diffuse = nil;
    self->_specular = nil;
    return self;
}
- (void)releaseBuffer {
    if (nil != self->_ambient) {
        free(self->_ambient);
        self->_ambient = nil;
    }
    if (nil != self->_diffuse) {
        free(self->_diffuse);
        self->_diffuse = nil;
    }
    if (nil != self->_specular) {
        free(self->_specular);
        self->_specular = nil;
    }
    return;
}
- (void)reflect {
    if (nil != self->_ambient) {
        glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, self->_ambient);
    }
    if (nil != self->_diffuse) {
        glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, self->_diffuse);
    }
    if (nil != self->_specular) {
        glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, self->_specular);
    }
    return;
}
- (void)setAmbient:(GLESColor*)color {
    if (nil == self->_ambient) {
        int memsize = 4 * sizeof(GLfloat);
        self->_ambient = (GLfloat*)malloc(memsize);
    }
    self->_ambient[0] = color.r;
    self->_ambient[1] = color.g;
    self->_ambient[2] = color.b;
    self->_ambient[3] = 1.0f;
    return;
}
- (void)setDiffuse:(GLESColor*)color {
    if (nil == self->_diffuse) {
        int memsize = 4 * sizeof(GLfloat);
        self->_diffuse = (GLfloat*)malloc(memsize);
    }
    self->_diffuse[0] = color.r;
    self->_diffuse[1] = color.g;
    self->_diffuse[2] = color.b;
    self->_diffuse[3] = 1.0f;
    return;
}
- (void)setSpecular:(GLESColor*)color {
    if (nil == self->_specular) {
        int memsize = 4 * sizeof(GLfloat);
        self->_specular = (GLfloat*)malloc(memsize);
    }
    self->_specular[0] = color.r;
    self->_specular[1] = color.g;
    self->_specular[2] = color.b;
    self->_specular[3] = 1.0f;
    return;
}
@end
