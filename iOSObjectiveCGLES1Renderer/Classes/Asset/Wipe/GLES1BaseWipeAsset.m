// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1BaseWipeAsset.h"
#import "GLES1Angle.h"
#import "GLES1Renderer.h"
@interface GLES1BaseWipeAsset ()
@end
@implementation GLES1BaseWipeAsset
- (void)create:(int)dimension {
    if (dimension == kDimension2D) {
        [self create2D];
    } else {
        [self create3D];
    }
    return;
}
- (void)create2D {
    return;
}
- (void)create3D {
    return;
}
- (GLfloat)wipeIn:(GLfloat)delta totalTime:(GLfloat)totalTime {
    GLfloat scale = [self easeIn:self->_time start:0.0f end:self->_maxScale totalTime:totalTime];
    self->_time += delta;
    return scale;
}
- (GLfloat)wipeOut:(GLfloat)delta totalTime:(GLfloat)totalTime {
    GLfloat scale = [self easeIn:self->_time start:self->_maxScale end:0.0f totalTime:totalTime];
    self->_time += delta;
    return scale;
}
- (GLfloat)easeIn:(GLfloat)currentTime start:(GLfloat)start end:(GLfloat)end totalTime:(GLfloat)totalTime {
    float rate = currentTime / totalTime;
    float diff = end - start;
    if (1.0f <= rate) {
        rate = 1.0f;
    }
    return diff * powf(2, 10.0f * (rate - 1.0f)) + start;
}
@end
