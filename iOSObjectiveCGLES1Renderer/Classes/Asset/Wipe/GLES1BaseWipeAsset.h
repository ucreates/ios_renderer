// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1BaseWipeAsset_h
#define GLES1BaseWipeAsset_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAsset.h"
@interface GLES1BaseWipeAsset : GLES1BaseAsset {
    int _divideCount;
    GLfloat _radius;
    GLfloat _time;
    GLfloat _maxScale;
}
- (void)create:(int)dimension;
- (GLfloat)wipeIn:(GLfloat)delta totalTime:(GLfloat)totalTime;
- (GLfloat)wipeOut:(GLfloat)delta totalTime:(GLfloat)totalTime;
@end
#endif /* GLES1BaseWipeAsset_h */
