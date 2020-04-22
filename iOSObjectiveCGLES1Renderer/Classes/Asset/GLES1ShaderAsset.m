// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1ShaderAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@implementation GLES1ShaderAsset
- (id)init {
    self->_shaderType = GL_SMOOTH;
    return self;
}
- (void)setFlat {
    self->_shaderType = GL_FLAT;
    return;
}
- (void)setPhong {
    self->_shaderType = GL_SMOOTH;
    return;
}
- (void)shade {
    glShadeModel(self->_shaderType);
    return;
}
@end
