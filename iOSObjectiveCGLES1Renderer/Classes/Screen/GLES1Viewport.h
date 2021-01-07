// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Viewport_h
#define GLES1Viewport_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Camera.h"
#import "GLES1Color.h"
@interface GLES1Viewport : NSObject
@property GLint width;
@property GLint height;
- (id)init;
- (void)update:(GLES1Camera*)camera;
- (void)setScreenSize:(GLuint)width height:(GLint)height;
- (GLfloat)getAspectRatio;
@end
#endif /* GLES1Viewport_h */
