// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1BaseAsset_h
#define GLES1BaseAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Blend.h"
#import "GLES1Color.h"
#import "GLES1Material.h"
#import "GLES1ShaderAsset.h"
#import "GLES1TextureAsset.h"
#import "GLES1Transform.h"
#import "GLES1VertexArray.h"
@interface GLES1BaseAsset : NSObject {
    GLfloat _width;
    GLfloat _height;
    GLfloat _depth;
    GLES1VertexArray* _vertex;
    GLES1Color* _color;
    GLES1Blend* _blend;
    GLES1ShaderAsset* _shader;
    GLES1Material* _material;
    GLES1TextureAsset* _texture;
}
@property GLES1Transform* transform;
@property(readonly) GLenum renderMode;
@property(readonly) GLES1VertexArray* vertex;
@property(readonly) GLES1Material* material;
@property(readonly) GLES1TextureAsset* texture;
@property(readonly) GLES1Blend* blend;
@property(readonly) GLES1ShaderAsset* shader;
- (id)init;
- (void)create;
- (void)create:(NSString*)texturePath;
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit;
- (void)createMipmap:(NSMutableArray<NSString*>*)texturePaths;
- (void)dispose;
- (void)setVertex:(GLES1VertexArray*)vertex;
- (void)setMaterial:(GLES1Material*)material;
- (void)setBlend:(GLES1Blend*)blend;
- (void)setShader:(GLES1ShaderAsset*)shader;
@end
#endif /* GLES1BaseAsset_h */
