// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef TextureAnimatorAsset_h
#define TextureAnimatorAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAnimatorAsset.h"
#import "BaseAsset.h"
@interface TextureAnimatorAsset : BaseAnimatorAsset {
    NSMutableArray<BaseAsset*>* _animationFrameAssets;
}
- (void)add:(BaseAsset*)asset;
@end
#endif /* TextureAnimatorAsset_h */
