// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Fog.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
@implementation GLES1Fog
- (id)init:(GLenum)fogMode {
    int pmemsize = 2 * sizeof(GLfloat);
    self->_position = (GLfloat*)malloc(pmemsize);
    self->_position[0] = 0.0f;
    self->_position[1] = 1.0f;
    self->_fogMode = fogMode;
    self->_density = 1.0f;
    self->_hint = GL_DONT_CARE;
    return self;
}
- (void)releaseBuffer {
    if (nil != self->_position) {
        free(self->_position);
        self->_position = nil;
    }
    if (nil != self->_color) {
        free(self->_color);
        self->_color = nil;
    }
    return;
}
- (void)mist {
    glFogx(GL_FOG_MODE, self->_fogMode);
    glFogfv(GL_FOG_COLOR, self->_color);
    glFogf(GL_FOG_DENSITY, self->_density);
    glHint(GL_FOG_HINT, self->_hint);
    glFogf(GL_FOG_START, self->_position[0]);
    glFogf(GL_FOG_END, self->_position[1]);
    return;
}
- (void)setPosition:(GLfloat)start end:(GLfloat)end {
    self->_position[0] = start;
    self->_position[1] = end;
    return;
}
- (void)setColor:(GLES1Color*)color {
    if (nil == self->_color) {
        int memsize = 4 * sizeof(GLfloat);
        self->_color = (GLfloat*)malloc(memsize);
    }
    self->_color[0] = color.r;
    self->_color[1] = color.g;
    self->_color[2] = color.b;
    self->_color[3] = color.a;
    return;
}
- (void)setDensity:(GLfloat)density {
    self->_density = density;
    return;
}
- (void)setHint:(GLenum)hint {
    self->_hint = hint;
    return;
}
@end
