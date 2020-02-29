// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef ProjectonTransfomMatrix_h
#define ProjectonTransfomMatrix_h
#import <GLKit/GLKit.h>
@interface ProjectonTransfomMatrix : NSObject
- (void)transform2D:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far;
- (void)transform3D:(GLfloat)fov aspectRatio:(GLfloat)aspectRatio near:(GLfloat)near far:(GLfloat)far;
@end
#endif /* ProjectonTransfomMatrix_h */
