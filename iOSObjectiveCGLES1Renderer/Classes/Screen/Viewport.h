// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Viewport_h
#define Viewport_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Camera.h"
#import "GLESColor.h"
@interface Viewport : NSObject
- (id)init;
- (void)update:(GLES1Camera*)camera;
- (void)setScreenSize:(GLuint)width height:(GLint)height;
- (GLfloat)getAspectRatio;
@end
#endif /* Viewport_h */
