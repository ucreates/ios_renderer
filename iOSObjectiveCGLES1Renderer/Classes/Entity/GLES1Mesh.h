// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Mesh_h
#define GLES1Mesh_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAsset.h"
@interface GLES1Mesh : GLES1BaseAsset {
    NSString* _name;
    NSString* _useMaterial;
    GLenum _renderMode;
}
@property(readonly) NSString* name;
@property(readonly) NSString* useMaterial;
- (id)init;
- (void)setName:(NSString*)name;
- (void)setUseMaterial:(NSString*)useMaterial;
- (void)setRenderMode:(GLenum)renderMode;
@end
#endif /* GLES1Mesh_h */
