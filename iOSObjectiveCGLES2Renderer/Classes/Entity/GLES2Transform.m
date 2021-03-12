// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Transform.h"
#import "GLES2Angle.h"
@implementation GLES2Transform
@synthesize position;
@synthesize scale;
@synthesize rotation;
- (id)init {
    self.position = GLKVector3Make(0.0f, 0.0f, 0.0f);
    self.scale = GLKVector3Make(1.0f, 1.0f, 1.0f);
    self.rotation = GLKVector3Make(0.0f, 0.0f, 0.0f);
    return self;
}
- (GLKMatrix4)getMatrix {
    GLKMatrix4 matrix = GLKMatrix4Identity;
    matrix = GLKMatrix4Translate(matrix, self.position.x, self.position.y, self.position.z);
    matrix = GLKMatrix4Scale(matrix, self.scale.x, self.scale.y, self.scale.z);
    matrix = GLKMatrix4Rotate(matrix, [GLES2Angle toRadian:self.rotation.x], 1.0, 0, 0);
    matrix = GLKMatrix4Rotate(matrix, [GLES2Angle toRadian:self.rotation.y], 0, 1.0, 0);
    matrix = GLKMatrix4Rotate(matrix, [GLES2Angle toRadian:self.rotation.z], 0, 0, 1.0);
    return matrix;
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
