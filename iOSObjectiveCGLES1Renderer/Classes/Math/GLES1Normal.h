// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Normal_h
#define GLES1Normal_h
#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
@interface GLES1Normal : NSObject
+ (GLKVector3)toNormal:(GLfloat)x1 y1:(GLfloat)y1 z1:(GLfloat)z1 x2:(GLfloat)x2 y2:(GLfloat)y2 z2:(GLfloat)z2 x3:(GLfloat)x3 y3:(GLfloat)y3 z3:(GLfloat)z3;
@end
#endif /* GLES1Normal_h */
