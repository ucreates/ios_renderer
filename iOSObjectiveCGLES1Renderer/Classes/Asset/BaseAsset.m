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
    return self;
}
- (void)create {
    return;
}
- (void)dispose {
    if (nil != self->_vertex) {
        [self->_vertex releaseBuffer];
    }
    if (nil != self->_material) {
        [self->_material releaseBuffer];
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
@end
