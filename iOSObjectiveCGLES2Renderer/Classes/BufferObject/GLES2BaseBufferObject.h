// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2BaseBufferObject_h
#define GLES2BaseBufferObject_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@interface GLES2BaseBufferObject : NSObject {
    GLuint _bufferId;
}
@property(readonly) GLuint bufferId;
- (void)allocateBuffer;
- (void)releaseBuffer;
- (void)bind;
- (void)unbind;
- (void)rebind:(GLint)width height:(GLint)height;
@end
#endif /* GLES2BaseBufferObject_h */
