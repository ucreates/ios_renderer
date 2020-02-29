// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Camera.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface GLES1Camera ()
@end
@implementation GLES1Camera
@synthesize fov;
@synthesize near;
@synthesize far;
@synthesize eye;
@synthesize center;
@synthesize up;
@synthesize clearColor;
- (id)init {
    self->clearColor = [[GLESColor alloc] init];
    self->near = 1.0f;
    self->far = -1.0f;
    return self;
}
- (void)setClippingPlane:(GLfloat)nearPlane farPlane:(GLfloat)farPlane {
    self.near = nearPlane;
    self.far = farPlane;
    return;
}
- (void)setClear:(GLESColor*)clearColor {
    self.clearColor = clearColor;
    return;
}
- (void)setFOV:(GLfloat)fov {
    self.fov = fov;
    return;
}
- (void)setLookAt:(GLKVector3)eye center:(GLKVector3)center up:(GLKVector3)up {
    self.eye = eye;
    self.center = center;
    self.up = up;
    return;
}
@end
