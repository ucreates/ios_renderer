// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef Mesh_h
#define Mesh_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
@interface Mesh : BaseAsset {
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
#endif /* Mesh_h */
