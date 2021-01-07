// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1ModelViewTransformMatrix_h
#define GLES1ModelViewTransformMatrix_h
#import <GLKit/GLKit.h>
@interface GLES1ModelViewTransformMatrix : NSObject
- (void)transform2D;
- (void)transform3D:(GLKVector3)eye center:(GLKVector3)center up:(GLKVector3)up;
@end
#endif /* GLES1ModelViewTransformMatrix_h */
