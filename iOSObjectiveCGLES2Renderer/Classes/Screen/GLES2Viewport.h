// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Viewport_h
#define GLES2Viewport_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Camera.h"
#import "GLES2Color.h"
@interface GLES2Viewport : NSObject
- (id)init;
- (void)update:(GLES2Camera*)camera;
- (void)setScreenSize:(GLuint)width height:(GLint)height;
- (GLfloat)getAspectRatio;
@end
#endif /* GLES2Viewport_h */
