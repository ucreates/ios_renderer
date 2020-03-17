// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Material_h
#define Material_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
@interface Material : NSObject {
    GLfloat* _ambient;
    GLfloat* _diffuse;
    GLfloat* _specular;
}
- (id)init;
- (void)releaseBuffer;
- (void)reflect;
- (void)setAmbient:(GLESColor*)color;
- (void)setDiffuse:(GLESColor*)color;
- (void)setSpecular:(GLESColor*)color;
@end
#endif /* Material_h */
