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
#import "GLES1BaseAsset.h"
#import "GLES1BaseWipeAsset.h"
#import "GLES1Camera.h"
#import "GLES1Color.h"
#import "GLES1Fog.h"
#import "GLES1Light.h"
#import "GLES1Viewport.h"
static const int kDimension2D = 2;
static const int kDimension3D = 3;
static const int kRGBA = 4;
static const int kWipeIn = 1;
static const int kWipeOut = 2;
@interface GLES1Renderer : NSObject {
    GLES1Fog* _fog;
    int _dimension;
}
@property(readonly) EAGLContext* context;
@property(readonly) GLES1Viewport* viewport;
@property(readonly) GLES1Camera* camera;
- (id)init;
- (void)create;
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height;
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height attachmentType:(GLenum)attachmentType;
- (void)delete;
- (void)rebind:(CAEAGLLayer*)layer;
- (void)transform:(int)dimension;
- (void)clear;
- (void)clear:(BOOL)depth;
- (void)render:(GLES1BaseWipeAsset*)asset wipeType:(int)wipeType delta:(GLfloat)delta totalTime:(GLfloat)totalTime;
- (void)render:(GLES1BaseAsset*)asset;
- (void)present;
- (void)addLight:(GLES1Light*)light;
- (void)setFog:(GLES1Fog*)fog;
@end
#endif /* GLES1Renderer_h */
