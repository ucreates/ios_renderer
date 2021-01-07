// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1TextureAtlasAnimatorAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Exponentiation.h"
#import "GLES1Renderer.h"
@interface GLES1TextureAtlasAnimatorAsset ()
@end
@implementation GLES1TextureAtlasAnimatorAsset
- (id)init {
    self = [super init];
    self->_textureAtlasAsset = nil;
    self->_animationFrameUVs = nil;
    self->_totalFrameCount = 0;
    return self;
}
- (void)dispose {
    [super dispose];
    if (nil != self->_textureAtlasAsset) {
        [self->_textureAtlasAsset dispose];
    }
    for (int i = 0; i < self->_totalFrameCount; i++) {
        free(self->_animationFrameUVs[i]);
    }
    free(self->_animationFrameUVs);
    return;
}
- (void)setTestureAtlas:(GLES1BaseAsset*)asset {
    [asset.vertex releaseUVBuffer];
    self->_textureAtlasAsset = asset;
    return;
}
- (void)addFrameUVs:(GLfloat*)uvs uvsCount:(int)uvsCount {
    int uvmemsize = uvsCount * sizeof(GLfloat);
    GLfloat* tmpUVs = (GLfloat*)malloc(uvmemsize);
    for (int i = 0; i < uvsCount; i++) {
        tmpUVs[i] = uvs[i];
    }
    if (nil == self->_animationFrameUVs) {
        self->_animationFrameUVs = (GLfloat**)malloc(sizeof(GLfloat*));
        self->_animationFrameUVs[0] = (GLfloat*)malloc(uvmemsize);
        for (int i = 0; i < uvsCount; i++) {
            self->_animationFrameUVs[0][i] = tmpUVs[i];
        }
        self->_totalFrameCount++;
        free(tmpUVs);
    } else {
        int frameMemsize = self->_totalFrameCount * sizeof(GLfloat*);
        GLfloat** tmpAnimationFrameUVs = (GLfloat**)malloc(frameMemsize);
        for (int i = 0; i < self->_totalFrameCount; i++) {
            tmpAnimationFrameUVs[i] = (GLfloat*)malloc(uvmemsize);
            for (int j = 0; j < uvsCount; j++) {
                tmpAnimationFrameUVs[i][j] = self->_animationFrameUVs[i][j];
            }
        }
        for (int i = 0; i < self->_totalFrameCount; i++) {
            free(self->_animationFrameUVs[i]);
        }
        free(self->_animationFrameUVs);
        self->_totalFrameCount++;
        frameMemsize = self->_totalFrameCount * sizeof(GLfloat*);
        self->_animationFrameUVs = (GLfloat**)malloc(frameMemsize);
        for (int i = 0; i < self->_totalFrameCount - 1; i++) {
            self->_animationFrameUVs[i] = (GLfloat*)malloc(uvmemsize);
            for (int j = 0; j < uvsCount; j++) {
                self->_animationFrameUVs[i][j] = tmpAnimationFrameUVs[i][j];
            }
        }
        for (int i = 0; i < self->_totalFrameCount - 1; i++) {
            free(tmpAnimationFrameUVs[i]);
        }
        free(tmpAnimationFrameUVs);
        int idx = self->_totalFrameCount - 1;
        self->_animationFrameUVs[idx] = (GLfloat*)malloc(uvmemsize);
        for (int j = 0; j < uvsCount; j++) {
            self->_animationFrameUVs[idx][j] = tmpUVs[j];
        }
        free(tmpUVs);
    }
    return;
}
- (GLES1BaseAsset*)getCurrentFrame {
    GLfloat* uvs = nil;
    int index = self->_currentTextureIndex % self->_totalFrameCount;
    if (self->_frameSpan != self->_currentFrame) {
        uvs = self->_animationFrameUVs[index];
        self->_currentFrame++;
    } else {
        uvs = self->_animationFrameUVs[index];
        if (self->_currentTextureIndex == self->_totalFrameCount - 1) {
            self->_currentTextureIndex = 0;
        } else {
            self->_currentTextureIndex++;
        }
        self->_currentFrame = 0;
    }
    self->_textureAtlasAsset.transform = self.transform;
    [self->_textureAtlasAsset.vertex resetUVs:uvs];
    return self->_textureAtlasAsset;
}
@end
