// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Light_h
#define GLES1Light_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
@interface GLES1Light : NSObject {
    GLenum _lightId;
    GLfloat* _position;
    GLfloat* _direction;
    GLfloat* _ambient;
    GLfloat* _diffuse;
}
- (id)init:(GLenum)lightId;
- (void)releaseBuffer;
- (void)enable;
- (void)disable;
- (void)illuminate;
- (void)setPosition:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
- (void)setDirection:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
- (void)setAmbient:(GLESColor*)color;
- (void)setDiffuse:(GLESColor*)color;
@end
#endif /* GLES1Light_h */
