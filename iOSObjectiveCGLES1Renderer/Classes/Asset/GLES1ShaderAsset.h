// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1ShaderAsset_h
#define GLES1ShaderAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface GLES1ShaderAsset : NSObject {
    GLenum _shaderType;
}
- (id)init;
- (void)setFlat;
- (void)setPhong;
- (void)shade;
@end
#endif /* GLES1ShaderAsset_h */
