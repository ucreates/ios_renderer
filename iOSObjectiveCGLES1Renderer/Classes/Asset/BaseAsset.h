// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef BaseAsset_h
#define BaseAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1ShaderAsset.h"
#import "GLESBlend.h"
#import "GLESColor.h"
#import "Material.h"
#import "TextureAsset.h"
#import "Transform.h"
#import "VertexArray.h"
@interface BaseAsset : NSObject {
    GLfloat _width;
    GLfloat _height;
    GLfloat _depth;
    VertexArray* _vertex;
    GLESColor* _color;
    GLESBlend* _blend;
    GLES1ShaderAsset* _shader;
    Material* _material;
    TextureAsset* _texture;
}
@property Transform* transform;
@property(readonly) GLenum renderMode;
@property(readonly) VertexArray* vertex;
@property(readonly) Material* material;
@property(readonly) TextureAsset* texture;
@property(readonly) GLESBlend* blend;
@property(readonly) GLES1ShaderAsset* shader;
- (id)init;
- (void)create;
- (void)create:(NSString*)texturePath;
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit;
- (void)createMipmap:(NSMutableArray<NSString*>*)texturePaths;
- (void)dispose;
- (void)setVertex:(VertexArray*)vertex;
- (void)setMaterial:(Material*)material;
- (void)setBlend:(GLESBlend*)blend;
- (void)setShader:(GLES1ShaderAsset*)shader;
@end
#endif /* BaseAsset_h */
