// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1TextureAnimatorAsset_h
#define GLES1TextureAnimatorAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAnimatorAsset.h"
#import "GLES1BaseAsset.h"
@interface GLES1TextureAnimatorAsset : GLES1BaseAnimatorAsset {
    NSMutableArray<GLES1BaseAsset*>* _animationFrameAssets;
}
- (void)add:(GLES1BaseAsset*)asset;
@end
#endif /* GLES1TextureAnimatorAsset_h */
