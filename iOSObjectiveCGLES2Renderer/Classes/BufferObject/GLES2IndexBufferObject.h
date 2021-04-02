// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2IndexBufferObject_h
#define GLES2IndexBufferObject_h
#import "GLES2BaseVertexBufferObject.h"
#import "GLES2ProgramObject.h"
@interface GLES2IndexBufferObject : GLES2BaseVertexBufferObject {
    int _indexCount;
    int _indiciesMemsize;
    GLushort* _indicies;
}
- (id)init;
- (void)bind;
- (void)setIndicies:(GLushort*)indicies indiciesCount:(int)indiciesCount;
@end
#endif /* GLES2IndexBufferObject_h */
