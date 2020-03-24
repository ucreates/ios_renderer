// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "BaseAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface BaseAsset ()
@end
@implementation BaseAsset
@synthesize transform;
- (id)init {
    self->transform = [[Transform alloc] init];
    self->_material = nil;
    self->_texture = nil;
    return self;
}
- (void)create {
    return;
}
- (void)create:(NSString*)texturePath {
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
- (void)setMaterial:(Material*)material {
    self->_material = material;
    return;
}
- (GLenum)renderMode {
    return GL_TRIANGLES;
}
- (VertexArray*)vertex {
    return nil;
}
- (Material*)material {
    return self->_material;
}
- (TextureAsset*)texture {
    return self->_texture;
}
@end
