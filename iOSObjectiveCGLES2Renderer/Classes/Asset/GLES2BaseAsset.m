// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2BaseAsset.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@interface GLES2BaseAsset ()
@end
@implementation GLES2BaseAsset
@synthesize transform;
- (id)init {
    self->transform = [[GLES2Transform alloc] init];
    return self;
}
- (void)create {
    return;
}
- (void)create:(NSString*)texturePath textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber {
    return;
}
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber {
    return;
}
- (void)bind:(double)delta {
    if (nil != self->_texture) {
        glActiveTexture(self->_texture.textureUnit);
        glBindTexture(GL_TEXTURE_2D, self->_texture.textureId);
        [GLES2Shader setUniform1i:self->_texture.textureUnitName programObjectHandle:self->_po.handle value:self->_texture.textureNumber];
    }
    if (nil != self->_callback) {
        self->_callback(delta);
    }
    [self.vertex bind:self.po];
    return;
}
- (void)setProgramObject:(GLES2ProgramObject*)programObject {
    self->_po = programObject;
    return;
}
- (void)setBindCallback:(bindCallBack)callback {
    self->_callback = callback;
    return;
}
- (GLenum)renderType {
    return GL_TRIANGLES;
}
- (GLES2ProgramObject*)po {
    return self->_po;
}
- (GLES2Vertex*)vertex {
    return self->_vertex;
}
@end
