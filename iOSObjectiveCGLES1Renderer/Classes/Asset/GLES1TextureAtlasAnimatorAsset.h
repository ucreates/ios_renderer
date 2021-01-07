// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1TextureAtlasAnimatorAsset_h
#define GLES1TextureAtlasAnimatorAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAnimatorAsset.h"
#import "GLES1BaseAsset.h"
@interface GLES1TextureAtlasAnimatorAsset : GLES1BaseAnimatorAsset {
    GLES1BaseAsset* _textureAtlasAsset;
    GLfloat** _animationFrameUVs;
    int _totalFrameCount;
}
- (void)setTestureAtlas:(GLES1BaseAsset*)asset;
- (void)addFrameUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
@end
#endif /* GLES1TextureAtlasAnimatorAsset_h */
