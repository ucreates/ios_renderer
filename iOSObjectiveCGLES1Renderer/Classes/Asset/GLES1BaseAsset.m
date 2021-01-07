// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1BaseAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface GLES1BaseAsset ()
@end
@implementation GLES1BaseAsset
@synthesize transform;
- (id)init {
    self->transform = [[GLES1Transform alloc] init];
    self->_material = nil;
    self->_texture = nil;
    self->_blend = nil;
    self->_shader = nil;
    return self;
}
- (void)create {
    return;
}
- (void)create:(NSString*)texturePath {
    return;
}
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit {
    return;
}
- (void)createMipmap:(NSMutableArray<NSString*>*)texturePaths {
    return;
}
- (void)dispose {
    if (nil != self->_vertex) {
        [self->_vertex releaseBuffer];
    }
    if (nil != self->_material) {
        [self->_material releaseBuffer];
    }
    if (nil != self->_texture) {
        [self->_texture releaseBuffer];
    }
    return;
}
- (void)setVertex:(GLES1VertexArray*)vertex {
    self->_vertex = vertex;
    return;
}
- (void)setMaterial:(GLES1Material*)material {
    self->_material = material;
    return;
}
- (void)setBlend:(GLES1Blend*)blend {
    self->_blend = blend;
    return;
}
- (void)setShader:(GLES1ShaderAsset*)shader {
    self->_shader = shader;
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (GLES1VertexArray*)vertex {
    return self->_vertex;
}
- (GLES1Material*)material {
    return self->_material;
}
- (GLES1TextureAsset*)texture {
    return self->_texture;
}
- (GLES1Blend*)blend {
    return self->_blend;
}
- (GLES1ShaderAsset*)shader {
    return self->_shader;
}
@end
