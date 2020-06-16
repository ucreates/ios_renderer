// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef TextureAsset_h
#define TextureAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface TextureAsset : NSObject {
    GLuint _textureId;
    CGSize _uvRatio;
    CGSize _size;
    GLenum _alphaComparisonFunction;
    GLclampf _alphaReferenceValue;
}
@property(readonly) GLuint textureId;
@property(readonly) CGSize size;
@property(readonly) CGSize uvRatio;
@property(readonly) GLenum alphaComparisonFunction;
@property(readonly) GLclampf alphaReferenceValue;
- (id)init;
- (void)releaseBuffer;
- (void)load:(NSString*)path;
- (void)loadMipmap:(NSMutableArray<NSString*>*)paths;
@end
#endif /* TextureAsset_h */
