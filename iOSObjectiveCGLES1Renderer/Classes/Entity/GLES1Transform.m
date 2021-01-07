// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Transform.h"
@implementation GLES1Transform
@synthesize position;
@synthesize scale;
@synthesize rotation;
- (id)init {
    self.position = GLKVector3Make(0.0f, 0.0f, 0.0f);
    self.scale = GLKVector3Make(1.0f, 1.0f, 1.0f);
    self.rotation = GLKVector3Make(0.0f, 0.0f, 0.0f);
    return self;
}
- (void)setPosition:(GLfloat)x y:(GLfloat)y z:(GLfloat)z {
    self.position = GLKVector3Make(x, y, z);
    return;
}
- (void)setScale:(GLfloat)x y:(GLfloat)y z:(GLfloat)z {
    self.scale = GLKVector3Make(x, y, z);
    return;
}
- (void)setRotation:(GLfloat)x y:(GLfloat)y z:(GLfloat)z {
    self.rotation = GLKVector3Make(x, y, z);
    return;
}
@end
