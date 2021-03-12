// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Camera_h
#define GLES2Camera_h
#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "GLES2Color.h"
@interface GLES2Camera : NSObject
@property GLfloat fov;
@property GLfloat orthoNear;
@property GLfloat orthoFar;
@property GLfloat perspectiveNear;
@property GLfloat perspectiveFar;
@property GLKVector3 eye;
@property GLKVector3 center;
@property GLKVector3 up;
@property GLES2Color* clearColor;
- (id)init;
- (void)setClippingPlane:(GLfloat)nearPlane farPlane:(GLfloat)farPlane dimension:(int)dimension;
- (void)setClear:(GLES2Color*)clearColor;
- (void)setFOV:(GLfloat)fov;
- (void)setLookAt:(GLKVector3)eye center:(GLKVector3)center up:(GLKVector3)up;
@end
#endif /* GLES2Camera_h */
