// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Transform_h
#define GLES2Transform_h
#import <GLKit/GLKit.h>
@interface GLES2Transform : NSObject
@property GLKVector3 position;
@property GLKVector3 scale;
@property GLKVector3 rotation;
- (GLKMatrix4)getMatrix;
- (void)setPosition:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
- (void)setScale:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
- (void)setRotation:(GLfloat)x y:(GLfloat)y z:(GLfloat)z;
@end
#endif /* GLES2Transform_h */
