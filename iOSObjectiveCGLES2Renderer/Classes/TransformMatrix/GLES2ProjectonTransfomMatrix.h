// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2ProjectonTransfomMatrix_h
#define GLES2ProjectonTransfomMatrix_h
#import <GLKit/GLKit.h>
#import "GLES2ProgramObject.h"
@interface GLES2ProjectonTransfomMatrix : NSObject
- (GLKMatrix4)transform2D:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far;
- (GLKMatrix4)transform3D:(GLfloat)fov aspectRatio:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far;
@end
#endif /* GLES2ProjectonTransfomMatrix_h */
