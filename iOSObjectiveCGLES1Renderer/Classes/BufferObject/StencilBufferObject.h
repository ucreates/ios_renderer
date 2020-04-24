// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef StencilBufferObject_h
#define StencilBufferObject_h
#import "BaseBufferObject.h"
@interface StencilBufferObject : BaseBufferObject
- (void)allocateBuffer:(GLuint)width height:(GLint)height;
@end
#endif /* StencilBufferObject_h */
