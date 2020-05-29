// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef TextureAtlasAnimatorAsset_h
#define TextureAtlasAnimatorAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAnimatorAsset.h"
#import "BaseAsset.h"
@interface TextureAtlasAnimatorAsset : BaseAnimatorAsset {
    BaseAsset* _textureAtlasAsset;
    GLfloat** _animationFrameUVs;
    int _totalFrameCount;
}
- (void)setTestureAtlas:(BaseAsset*)asset;
- (void)addFrameUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
@end
#endif /* TextureAtlasAnimatorAsset_h */
