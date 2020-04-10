// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Fog_h
#define GLES1Fog_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
@interface GLES1Fog : NSObject {
    GLenum _fogMode;
    GLenum _hint;
    GLfloat* _position;
    GLfloat* _color;
    GLfloat _density;
}
- (id)init:(GLenum)fogMode;
- (void)releaseBuffer;
- (void)mist;
- (void)setPosition:(GLfloat)start end:(GLfloat)end;
- (void)setDirection:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
- (void)setColor:(GLESColor*)color;
- (void)setDensity:(GLfloat)density;
- (void)setHint:(GLenum)hint;
@end
#endif /* GLES1Fog_h */
