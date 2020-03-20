// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Angle.h"
#import <Foundation/Foundation.h>
@implementation GLES1Angle
+ (float)toRadian:(float)degree {
    return degree * M_PI / 180.0f;
}
@end
