// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Material_h
#define GLES1Material_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Color.h"
#import "GLES1TextureAsset.h"
@interface GLES1Material : NSObject {
    NSString* _name;
    GLfloat* _ambient;
    GLfloat* _diffuse;
    GLfloat* _specular;
    BOOL _hasTexture;
    GLES1TextureAsset* _diffuseTexture;
    GLES1TextureAsset* _ambientTexture;
    GLES1TextureAsset* _normalTexture;
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
- (void)setAmbient:(GLES1Color*)color;
- (void)setDiffuse:(GLES1Color*)color;
- (void)setSpecular:(GLES1Color*)color;
- (void)setDiffuseTexture:(NSString*)path;
- (void)setAmbientTexture:(NSString*)path;
- (void)setNormalTexture:(NSString*)path;
@end
#endif /* GLES1Material_h */
