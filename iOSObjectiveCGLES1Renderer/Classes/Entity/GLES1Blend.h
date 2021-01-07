// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Blend_h
#define GLES1Blend_h
#import <GLKit/GLKit.h>
@interface GLES1Blend : NSObject {
    GLenum _source;
    GLenum _destination;
}
- (id)init;
- (id)init:(GLenum)source g:(GLenum)destination;
- (void)normal;
- (void)additive;
- (void)multiplication;
@property(readonly) GLenum source;
@property(readonly) GLenum destination;
@end
#endif /* GLES1Blend_h */
