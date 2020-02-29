// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef BaseBufferObject_h
#define BaseBufferObject_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface BaseBufferObject : NSObject {
    GLuint _bufferId;
}
@property(readonly) GLuint bufferId;
- (void)allocateBuffer;
- (void)releaseBuffer;
- (void)bind;
- (void)unbind;
- (void)rebind:(GLint)width height:(GLint)height;
@end
#endif /* BaseBufferObject_h */
