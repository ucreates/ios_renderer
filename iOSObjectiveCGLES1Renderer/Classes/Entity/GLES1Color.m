// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Color.h"
@implementation GLES1Color
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
+ (GLES1Color*)white {
    return [[GLES1Color alloc] init:1.0f g:1.0f b:1.0f a:1.0f];
}
+ (GLES1Color*)black {
    return [[GLES1Color alloc] init:0.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLES1Color*)red {
    return [[GLES1Color alloc] init:1.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLES1Color*)red:(GLfloat)alpha {
    return [[GLES1Color alloc] init:1.0f g:0.0f b:0.0f a:alpha];
}
+ (GLES1Color*)green {
    return [[GLES1Color alloc] init:0.0f g:1.0f b:0.0f a:1.0f];
}
+ (GLES1Color*)green:(GLfloat)alpha {
    return [[GLES1Color alloc] init:0.0f g:1.0f b:0.0f a:alpha];
}
+ (GLES1Color*)blue {
    return [[GLES1Color alloc] init:0.0f g:0.0f b:1.0f a:1.0f];
}
+ (GLES1Color*)blue:(GLfloat)alpha {
    return [[GLES1Color alloc] init:0.0f g:0.0f b:1.0f a:alpha];
}
@end
