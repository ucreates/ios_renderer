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
    Material* _material;
    TextureAsset* _texture;
}
@property Transform* transform;
@property(readonly) GLenum renderMode;
@property(readonly) VertexArray* vertex;
@property(readonly) Material* material;
@property(readonly) TextureAsset* texture;
@property(readonly) GLESBlend* blend;
- (id)init;
- (void)create;
- (void)create:(NSString*)texturePath;
- (void)dispose;
- (void)setMaterial:(Material*)material;
- (void)setBlend:(GLESBlend*)blend;
@end
#endif /* BaseAsset_h */
