// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1Renderer_h
#define GLES1Renderer_h
#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
#import "GLES1Camera.h"
#import "GLES1Light.h"
#import "GLESColor.h"
#import "Viewport.h"
static const int kDimension2D = 2;
static const int kDimension3D = 3;
static const int kRGBA = 4;
@interface GLES1Renderer : NSObject
@property(readonly) EAGLContext* context;
@property(readonly) Viewport* viewport;
@property(readonly) GLES1Camera* camera;
- (id)init;
- (void)create;
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height;
- (void)delete;
- (void)rebind:(CAEAGLLayer*)layer;
- (void)transform:(int)dimension;
- (void)render:(BaseAsset*)asset;
- (void)present;
- (void)addLight:(GLES1Light*)light;
@end
#endif /* GLES1Renderer_h */
