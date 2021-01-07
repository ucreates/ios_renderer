// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Color_h
#define GLES1Color_h
#import <GLKit/GLKit.h>
@interface GLES1Color : NSObject
@property GLfloat r;
@property GLfloat g;
@property GLfloat b;
@property GLfloat a;
- (id)init;
- (id)init:(GLfloat)r g:(GLfloat)g b:(GLfloat)b a:(GLfloat)a;
+ (GLES1Color*)white;
+ (GLES1Color*)black;
+ (GLES1Color*)red;
+ (GLES1Color*)red:(GLfloat)alpha;
+ (GLES1Color*)green;
+ (GLES1Color*)green:(GLfloat)alpha;
+ (GLES1Color*)blue;
+ (GLES1Color*)blue:(GLfloat)alpha;
@end
#endif /* GLES1Color_h */
