// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "Mesh.h"
#import "GLES1Normal.h"
#import "GLES1Renderer.h"
#import "GLESColor.h"
@interface Mesh ()
@end
@implementation Mesh
- (id)init {
    self = [super init];
    self->_vertex = [[VertexArray alloc] init:kDimension3D];
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
