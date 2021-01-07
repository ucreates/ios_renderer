// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Light.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
@implementation GLES1Light
- (id)init:(GLenum)lightId {
    int pmemsize = 4 * sizeof(GLfloat);
    self->_position = (GLfloat*)malloc(pmemsize);
    self->_direction = nil;
    self->_ambient = nil;
    self->_diffuse = nil;
    self->_specular = nil;
    self->_position[3] = 1.0f;
    self->_lightId = lightId;
    return self;
}
- (void)releaseBuffer {
    if (nil != self->_position) {
        free(self->_position);
        self->_position = nil;
    }
    if (nil != self->_direction) {
        free(self->_direction);
        self->_direction = nil;
    }
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
- (void)enable {
    glEnable(self->_lightId);
    return;
}
- (void)disable {
    glDisable(self->_lightId);
    return;
}
- (void)illuminate {
    glLightfv(self->_lightId, GL_POSITION, self->_position);
    if (nil != self->_ambient) {
        glLightfv(self->_lightId, GL_AMBIENT, self->_ambient);
    }
    if (nil != self->_diffuse) {
        glLightfv(self->_lightId, GL_DIFFUSE, self->_diffuse);
    }
    if (nil != self->_specular) {
        glLightfv(self->_lightId, GL_SPECULAR, self->_specular);
    }
    if (nil != self->_direction) {
        glLightfv(self->_lightId, GL_SPOT_DIRECTION, self->_direction);
    }
    return;
}
- (void)setPosition:(GLfloat)x y:(GLfloat)y z:(GLfloat)z {
    self->_position[0] = x;
    self->_position[1] = y;
    self->_position[2] = z;
    return;
}
- (void)setDirection:(GLfloat)x y:(GLfloat)y z:(GLfloat)z {
    if (nil == self->_direction) {
        int memsize = 3 * sizeof(GLfloat);
        self->_direction = (GLfloat*)malloc(memsize);
    }
    self->_direction[0] = x;
    self->_direction[1] = y;
    self->_direction[2] = z;
    return;
}
- (void)setAmbient:(GLES1Color*)color {
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
- (void)setDiffuse:(GLES1Color*)color {
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
- (void)setSpecular:(GLES1Color*)color {
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
