// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Blend.h"
@implementation GLES1Blend
@synthesize source;
@synthesize destination;
- (id)init {
    self->_source = GL_ZERO;
    self->_destination = GL_ZERO;
    return self;
}
- (id)init:(GLenum)source g:(GLenum)destination {
    self->_source = source;
    self->_destination = destination;
    return self;
}
- (void)normal {
    self->_source = GL_SRC_ALPHA;
    self->_destination = GL_ONE_MINUS_SRC_ALPHA;
    return;
}
- (void)additive {
    self->_source = GL_SRC_ALPHA;
    self->_destination = GL_ONE;
    return;
}
- (void)multiplication {
    self->_source = GL_ZERO;
    self->_destination = GL_SRC_COLOR;
    return;
}
- (GLenum)source {
    return self->_source;
}
- (GLenum)destination {
    return self->_destination;
}
@end
