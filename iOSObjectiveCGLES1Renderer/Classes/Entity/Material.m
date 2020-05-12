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
    self->_hasTexture = NO;
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
- (void)enable {
    if (NO != self->_hasTexture) {
        glActiveTexture(GL_TEXTURE0);
        glEnable(GL_TEXTURE_2D);
    }
    if (nil != self->_ambientTexture) {
        glActiveTexture(GL_TEXTURE1);
        glEnable(GL_TEXTURE_2D);
    }
    if (nil != self->_diffuseTexture) {
        glActiveTexture(GL_TEXTURE2);
        glEnable(GL_TEXTURE_2D);
    }
    return;
}
- (void)disable {
    if (NO != self->_hasTexture) {
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glActiveTexture(GL_TEXTURE0);
        glDisable(GL_TEXTURE_2D);
    }
    if (nil != self->_ambientTexture) {
        glActiveTexture(GL_TEXTURE1);
        glDisable(GL_TEXTURE_2D);
    }
    if (nil != self->_diffuseTexture) {
        glActiveTexture(GL_TEXTURE2);
        glDisable(GL_TEXTURE_2D);
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
    if (nil != self->_ambientTexture) {
        glClientActiveTexture(GL_TEXTURE1);
        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, self->_ambientTexture.textureId);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    }
    if (nil != self->_diffuseTexture) {
        glClientActiveTexture(GL_TEXTURE2);
        glActiveTexture(GL_TEXTURE2);
        glBindTexture(GL_TEXTURE_2D, self->_diffuseTexture.textureId);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    }
    glActiveTexture(GL_TEXTURE0);
    return;
}
- (void)setName:(NSString*)name {
    self->_name = name;
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
- (void)setUVs:(GLfloat*)uvs {
    if (NO != self->_hasTexture) {
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    }
    if (nil != self->_ambientTexture) {
        glActiveTexture(GL_TEXTURE1);
        glTexCoordPointer(2, GL_FLOAT, 0, uvs);
    }
    if (nil != self->_diffuseTexture) {
        glActiveTexture(GL_TEXTURE2);
        glTexCoordPointer(2, GL_FLOAT, 0, uvs);
    }
    return;
}
- (void)setDiffuseTexture:(TextureAsset*)texture {
    self->_diffuseTexture = texture;
    self->_hasTexture = YES;
    return;
}
- (void)setAmbientTexture:(TextureAsset*)texture {
    self->_ambientTexture = texture;
    self->_hasTexture = YES;
    return;
}
- (NSString*)name {
    return self->_name;
}
- (BOOL)hasTexture {
    return self->_hasTexture;
}
@end
