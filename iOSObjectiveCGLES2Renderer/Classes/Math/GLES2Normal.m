// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Normal.h"
#import <Foundation/Foundation.h>
@implementation GLES2Normal
+ (GLKVector3)toNormal:(GLfloat)x1 y1:(GLfloat)y1 z1:(GLfloat)z1 x2:(GLfloat)x2 y2:(GLfloat)y2 z2:(GLfloat)z2 x3:(GLfloat)x3 y3:(GLfloat)y3 z3:(GLfloat)z3 {
    GLfloat vx1 = x2 - x1;
    GLfloat vy1 = y2 - y1;
    GLfloat vz1 = z2 - z1;
    GLfloat vx2 = x3 - x1;
    GLfloat vy2 = y3 - y1;
    GLfloat vz2 = z3 - z1;
    GLfloat nx = vy1 * vz2 - vz1 * vy2;
    GLfloat ny = vz1 * vx2 - vx1 * vz2;
    GLfloat nz = vx1 * vy2 - vy1 * vx2;
    return GLKVector3Make(nx, ny, nz);
}
+ (GLKVector3)toOne:(GLKVector3)vector {
    GLfloat x = 0.0f;
    GLfloat y = 0.0f;
    GLfloat z = 0.0f;
    if (0 < fabsf(vector.x)) {
        x = vector.x / fabsf(vector.x);
    }
    if (0 < fabsf(vector.y)) {
        y = vector.y / fabsf(vector.y);
    }
    if (0 < fabsf(vector.z)) {
        z = vector.z / fabsf(vector.z);
    }
    return GLKVector3Make(x, y, z);
}
+ (GLKVector3)add:(GLKVector3)vector1 vector2:(GLKVector3)vector2 {
    return GLKVector3Add(vector1, vector2);
}
@end
