// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Color.h"
@implementation GLES2Color
@synthesize r;
@synthesize g;
@synthesize b;
@synthesize a;
- (id)init {
    self.r = 0.0f;
    self.g = 0.0f;
    self.b = 0.0f;
    self.a = 1.0f;
    return self;
}
- (id)init:(GLfloat)r g:(GLfloat)g b:(GLfloat)b a:(GLfloat)a {
    self.r = r;
    self.g = g;
    self.b = b;
    self.a = a;
    return self;
}
+ (GLfloat)getRandomColor {
    int color = rand() % 255;
    return (float)color / 255.0f;
}
+ (GLES2Color*)white {
    return [[GLES2Color alloc] init:1.0f g:1.0f b:1.0f a:1.0f];
}
+ (GLES2Color*)black {
    return [[GLES2Color alloc] init:0.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLES2Color*)red {
    return [[GLES2Color alloc] init:1.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLES2Color*)green {
    return [[GLES2Color alloc] init:0.0f g:1.0f b:0.0f a:1.0f];
}
+ (GLES2Color*)blue {
    return [[GLES2Color alloc] init:0.0f g:0.0f b:1.0f a:1.0f];
}
@end
