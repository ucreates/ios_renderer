// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2TextureAsset_h
#define GLES2TextureAsset_h
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface GLES2TextureAsset : NSObject {
    GLuint _textureId;
    GLenum _textureUnit;
    CGSize _uvRatio;
    CGSize _size;
    GLenum _alphaComparisonFunction;
    GLclampf _alphaReferenceValue;
    NSString* _textureUnitName;
    GLuint _textureNumber;
}
@property(readonly) GLuint textureId;
@property(readonly) GLenum textureUnit;
@property(readonly) NSString* textureUnitName;
@property(readonly) GLuint textureNumber;
@property(readonly) CGSize size;
@property(readonly) CGSize uvRatio;
@property(readonly) GLenum alphaComparisonFunction;
@property(readonly) GLclampf alphaReferenceValue;
- (id)init;
- (void)releaseBuffer;
- (void)load:(NSString*)path;
- (void)load:(NSString*)path textureUnit:(GLenum)textureUnit;
- (void)loadMipmap:(NSMutableArray<NSString*>*)paths;
- (void)loadMipmap:(NSMutableArray<NSString*>*)paths textureUnit:(GLenum)textureUnit;
- (void)setTextureUnit:(NSString*)textureUnitName textureNum:(int)textureNum;
@end
#endif /* GLES2TextureAsset_h */
