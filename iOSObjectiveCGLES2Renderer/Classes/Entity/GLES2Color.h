// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Color_h
#define GLES2Color_h
#import <GLKit/GLKit.h>
@interface GLES2Color : NSObject
@property GLfloat r;
@property GLfloat g;
@property GLfloat b;
@property GLfloat a;
- (id)init;
- (id)init:(GLfloat)r g:(GLfloat)g b:(GLfloat)b a:(GLfloat)a;
+ (GLfloat)getRandomColor;
+ (GLES2Color*)white;
+ (GLES2Color*)black;
+ (GLES2Color*)red;
+ (GLES2Color*)green;
+ (GLES2Color*)blue;
@end
#endif /* GLES2Color_h */
