// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TextureAnimatorAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Exponentiation.h"
#import "GLES1Renderer.h"
@interface TextureAnimatorAsset ()
@end
@implementation TextureAnimatorAsset
- (id)init {
    self = [super init];
    self->_animationFrameAssets = [[NSMutableArray<BaseAsset*> alloc] init];
    return self;
}
- (void)dispose {
    [super dispose];
    for (BaseAsset* asset in self->_animationFrameAssets) {
        [asset dispose];
    }
    return;
}
- (void)add:(BaseAsset*)asset {
    [self->_animationFrameAssets addObject:asset];
    return;
}
- (BaseAsset*)getCurrentFrame {
    BaseAsset* asset = nil;
    int index = self->_currentTextureIndex % (int)self->_animationFrameAssets.count;
    if (self->_frameSpan != self->_currentFrame) {
        asset = [self->_animationFrameAssets objectAtIndex:index];
        self->_currentFrame++;
    } else {
        asset = [self->_animationFrameAssets objectAtIndex:index];
        if (self->_currentTextureIndex == self->_animationFrameAssets.count - 1) {
            self->_currentTextureIndex = 0;
        } else {
            self->_currentTextureIndex++;
        }
        self->_currentFrame = 0;
    }
    asset.transform = self.transform;
    return asset;
}
@end
