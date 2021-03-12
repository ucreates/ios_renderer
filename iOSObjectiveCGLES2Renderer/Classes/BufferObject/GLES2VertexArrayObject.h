// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2VertexArrayObject_h
#define GLES2VertexArrayObject_h
#import "GLES2BaseVertexBufferObject.h"
#import "GLES2ProgramObject.h"
@interface GLES2VertexArrayObject : GLES2BaseVertexBufferObject
- (id)init:(int)dimension;
- (void)allocateBuffer;
- (void)bind:(GLES2ProgramObject*)programObject;
@end
#endif /* GLES2VertexArrayObject_h */
