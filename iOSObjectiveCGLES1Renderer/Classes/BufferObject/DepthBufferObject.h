// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef DepthBufferObject_h
#define DepthBufferObject_h
#import "BaseBufferObject.h"
@interface DepthBufferObject : BaseBufferObject
- (void)allocateBuffer:(GLuint)width height:(GLint)height;
@end
#endif /* DepthBufferObject_h */
