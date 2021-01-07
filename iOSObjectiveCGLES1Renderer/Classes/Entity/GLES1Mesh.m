// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Mesh.h"
#import "GLES1Color.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
@interface GLES1Mesh ()
@end
@implementation GLES1Mesh
- (id)init {
    self = [super init];
    self->_vertex = [[GLES1VertexArray alloc] init:kDimension3D];
    return self;
}
- (void)setRenderMode:(GLenum)renderMode {
    self->_renderMode = renderMode;
}
- (void)setName:(NSString*)name {
    self->_name = name;
    return;
}
- (void)setUseMaterial:(NSString*)useMaterial {
    self->_useMaterial = useMaterial;
    return;
}
- (GLenum)renderMode {
    return self->_renderMode;
}
@end
