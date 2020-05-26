// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef BaseAnimatorAsset_h
#define BaseAnimatorAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
@interface BaseAnimatorAsset : BaseAsset {
    int _frameSpan;
    int _currentFrame;
    int _currentTextureIndex;
}
- (id)init;
- (BaseAsset*)getCurrentFrame;
- (void)setFrameSpan:(int)frameSpan;
@end
#endif /* BaseAnimatorAsset_h */
