// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "BaseBufferObject.h"
#import <Foundation/Foundation.h>
@implementation BaseBufferObject
- (void)allocateBuffer {
    return;
}
- (void)releaseBuffer {
    return;
}
- (void)bind {
    return;
}
- (void)unbind {
    return;
}
- (void)rebind:(GLint)width height:(GLint)height {
    return;
}
- (GLuint)bufferId {
    return _bufferId;
}
@end
