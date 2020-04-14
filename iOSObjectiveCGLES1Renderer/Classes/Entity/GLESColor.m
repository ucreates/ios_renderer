// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLESColor.h"
@implementation GLESColor
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
+ (GLESColor*)white {
    return [[GLESColor alloc] init:1.0f g:1.0f b:1.0f a:1.0f];
}
+ (GLESColor*)black {
    return [[GLESColor alloc] init:0.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLESColor*)red {
    return [[GLESColor alloc] init:1.0f g:0.0f b:0.0f a:1.0f];
}
+ (GLESColor*)red:(GLfloat)alpha {
    return [[GLESColor alloc] init:1.0f g:0.0f b:0.0f a:alpha];
}
+ (GLESColor*)green {
    return [[GLESColor alloc] init:0.0f g:1.0f b:0.0f a:1.0f];
}
+ (GLESColor*)green:(GLfloat)alpha {
    return [[GLESColor alloc] init:0.0f g:1.0f b:0.0f a:alpha];
}
+ (GLESColor*)blue {
    return [[GLESColor alloc] init:0.0f g:0.0f b:1.0f a:1.0f];
}
+ (GLESColor*)blue:(GLfloat)alpha {
    return [[GLESColor alloc] init:0.0f g:0.0f b:1.0f a:alpha];
}
@end
