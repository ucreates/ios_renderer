// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Material_h
#define Material_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLESColor.h"
#import "TextureAsset.h"
@interface Material : NSObject {
    NSString* _name;
    GLfloat* _ambient;
    GLfloat* _diffuse;
    GLfloat* _specular;
    BOOL _hasTexture;
    TextureAsset* _diffuseTexture;
}
@property(readonly) BOOL hasTexture;
@property(readonly) NSString* name;
- (id)init;
- (void)releaseBuffer;
- (void)enable;
- (void)disable;
- (void)reflect;
- (void)setName:(NSString*)name;
- (void)setUVs:(GLfloat*)uvs;
- (void)setAmbient:(GLESColor*)color;
- (void)setDiffuse:(GLESColor*)color;
- (void)setSpecular:(GLESColor*)color;
- (void)setDiffuseTexture:(TextureAsset*)texture;
@end
#endif /* Material_h */
