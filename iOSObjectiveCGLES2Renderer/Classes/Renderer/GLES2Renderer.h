// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Renderer_h
#define GLES2Renderer_h
#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2BaseAsset.h"
#import "GLES2Camera.h"
#import "GLES2Color.h"
#import "GLES2Viewport.h"
static const int kRGBA = 4;
static const int kDimension2D = 2;
static const int kDimension3D = 3;
@interface GLES2Renderer : NSObject {
    GLES2Viewport* _viewport;
    NSString* _projectionAttributeName;
    NSString* _viewAttributeName;
    NSString* _modelAttributeName;
    GLKMatrix4 _projectionMatrix;
    GLKMatrix4 _viewMatrix;
}
@property(readonly) EAGLContext* context;
@property(readonly) GLES2Viewport* viewport;
@property(readonly) GLES2Camera* camera;
- (id)init;
- (void)create;
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height;
- (void)dispose;
- (void)rebind:(CAEAGLLayer*)layer;
- (void)clear;
- (void)transform:(int)dimension;
- (void)render:(GLES2BaseAsset*)asset delta:(NSTimeInterval)delta;
- (void)setProjectionMatrixAttributeName:(NSString*)projectionAttributeName;
- (void)setModelMatrixAttributeName:(NSString*)modelAttributeName;
- (void)setViewMatrixAttributeName:(NSString*)viewAttributeName;
@end
#endif /* GLES2Renderer_h */
