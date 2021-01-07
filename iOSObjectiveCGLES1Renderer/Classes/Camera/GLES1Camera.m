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
#import "GLES1Renderer.h"
@interface GLES1Camera ()
@end
@implementation GLES1Camera
@synthesize fov;
@synthesize orthoNear;
@synthesize orthoFar;
@synthesize perspectiveNear;
@synthesize perspectiveFar;
@synthesize eye;
@synthesize center;
@synthesize up;
@synthesize clearColor;
- (id)init {
    self->clearColor = [[GLES1Color alloc] init];
    self->orthoNear = 1.0f;
    self->orthoFar = -1.0f;
    self->perspectiveNear = 0.1f;
    self->perspectiveFar = 100.0f;
    return self;
}
- (void)setClippingPlane:(GLfloat)nearPlane farPlane:(GLfloat)farPlane dimension:(int)dimension {
    if (dimension == kDimension2D) {
        self.orthoNear = nearPlane;
        self.orthoFar = farPlane;
    } else {
        self.perspectiveNear = nearPlane;
        self.perspectiveFar = farPlane;
    }
    return;
}
- (void)setClear:(GLES1Color*)clearColor {
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
