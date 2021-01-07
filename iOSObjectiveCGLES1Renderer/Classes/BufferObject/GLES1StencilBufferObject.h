// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1StencilBufferObject_h
#define GLES1StencilBufferObject_h
#import "GLES1BaseBufferObject.h"
@interface GLES1StencilBufferObject : GLES1BaseBufferObject
- (void)allocateBuffer:(GLuint)width height:(GLint)height;
@end
#endif /* GLES1StencilBufferObject_h */
