// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Exponentiation.h"
#import <Foundation/Foundation.h>
@implementation GLES1Exponentiation
+ (GLuint)getExponentiation:(GLuint)number {
    if ((number & (number - 1)) == 0) {
        return number;
    }
    GLuint ret = 1;
    while (number > 0) {
        ret <<= 1;
        number >>= 1;
    }
    return ret;
}
@end
