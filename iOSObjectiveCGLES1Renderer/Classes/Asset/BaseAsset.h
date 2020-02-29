// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef BaseAsset_h
#define BaseAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
#import "Transform.h"
#import "VertexArray.h"
@interface BaseAsset : NSObject {
    GLfloat _width;
    GLfloat _height;
    GLfloat _depth;
    VertexArray* _vertex;
    GLESColor* _color;
}
@property Transform* transform;
@property(readonly) GLenum renderMode;
@property(readonly) VertexArray* vertex;
- (id)init;
- (void)create;
@end
#endif /* BaseAsset_h */
