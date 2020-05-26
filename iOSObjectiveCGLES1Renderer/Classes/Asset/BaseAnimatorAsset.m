// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "BaseAnimatorAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Exponentiation.h"
#import "GLES1Renderer.h"
@interface BaseAnimatorAsset ()
@end
@implementation BaseAnimatorAsset
- (id)init {
    self = [super init];
    self->_frameSpan = 0;
    self->_currentFrame = 0;
    self->_currentTextureIndex = 0;
    return self;
}
- (BaseAsset*)getCurrentFrame {
    return nil;
}
- (void)setFrameSpan:(int)frameSpan {
    self->_frameSpan = frameSpan;
    return;
}
@end
