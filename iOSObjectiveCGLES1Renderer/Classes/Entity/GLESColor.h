// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLESColor_h
#define GLESColor_h
#import <GLKit/GLKit.h>
@interface GLESColor : NSObject
@property GLfloat r;
@property GLfloat g;
@property GLfloat b;
@property GLfloat a;
- (id)init;
- (id)init:(GLfloat)r g:(GLfloat)g b:(GLfloat)b a:(GLfloat)a;
+ (GLESColor*)white;
+ (GLESColor*)black;
@end
#endif /* GLESColor_h */
