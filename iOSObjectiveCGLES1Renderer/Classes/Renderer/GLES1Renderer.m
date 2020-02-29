// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1Renderer.h"
#import <Foundation/Foundation.h>
#import "ColorBufferObject.h"
#import "DepthBufferObject.h"
#import "FrameBufferObject.h"
#import "ModelViewTransformMatrix.h"
#import "ProjectonTransfomMatrix.h"
@interface GLES1Renderer ()
@property FrameBufferObject* fbo;
@property ColorBufferObject* cbo;
@property DepthBufferObject* dbo;
@property ProjectonTransfomMatrix* projectonTransfomMatrix;
@property ModelViewTransformMatrix* modelViewTransfomMatrix;
@end
@implementation GLES1Renderer
@synthesize context;
@synthesize fbo;
@synthesize cbo;
@synthesize dbo;
@synthesize projectonTransfomMatrix;
@synthesize modelViewTransfomMatrix;
- (id)init {
    return self;
}
- (void)create {
    self->context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    self->projectonTransfomMatrix = [[ProjectonTransfomMatrix alloc] init];
    self->modelViewTransfomMatrix = [[ModelViewTransformMatrix alloc] init];
    self->_viewport = [[Viewport alloc] init];
    self->_camera = [[GLES1Camera alloc] init];
    [EAGLContext setCurrentContext:self->context];
    return;
}
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height {
    self->fbo = [[FrameBufferObject alloc] init];
    self->cbo = [[ColorBufferObject alloc] init];
    self->dbo = [[DepthBufferObject alloc] init];
    [self->fbo allocateBuffer];
    [self->cbo allocateBuffer];
    BOOL ret = [self.context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
    if (NO == ret) {
        NSLog(@"faild renderbufferStorage");
        return;
    }
    [self->dbo allocateBuffer:width height:height];
    GLenum status = glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES);
    if (GL_FRAMEBUFFER_COMPLETE_OES != status) {
        NSLog(@"glCheckFramebufferStatusOES::%x", status);
        return;
    }
}
- (void)delete {
    [EAGLContext setCurrentContext:nil];
    [self->fbo releaseBuffer];
    [self->cbo releaseBuffer];
    [self->dbo releaseBuffer];
    return;
}
- (void)rebind:(CAEAGLLayer*)layer {
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, self->cbo.bufferId);
    GLint width;
    GLint height;
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &width);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &height);
    [self->dbo rebind:width height:height];
    [self->_viewport setScreenSize:width height:height];
    return;
}
- (void)transform:(int)dimension {
    [EAGLContext setCurrentContext:self.context];
    if (kDimension2D == dimension) {
        GLfloat aspectRatio = [self->_viewport getAspectRatio];
        GLfloat near = self->_camera.near;
        GLfloat far = self->_camera.far;
        [self->fbo bind];
        [self->cbo bind];
        [self->_viewport update:self->_camera];
        [self->projectonTransfomMatrix transform2D:aspectRatio near:near far:far];
        [self->modelViewTransfomMatrix transform2D];
    } else {
        GLfloat aspectRatio = [self->_viewport getAspectRatio];
        GLfloat fov = self->_camera.fov;
        GLfloat near = self->_camera.near;
        GLfloat far = self->_camera.far;
        GLKVector3 eye = self->_camera.eye;
        GLKVector3 center = self->_camera.center;
        GLKVector3 up = self->_camera.up;
        [self->fbo bind];
        [self->cbo bind];
        [self->_viewport update:self->_camera];
        [self->projectonTransfomMatrix transform3D:fov aspectRatio:aspectRatio near:near far:far];
        [self->modelViewTransfomMatrix transform3D:eye center:center up:up];
    }
    return;
}
- (void)render:(BaseAsset*)asset {
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);
    glCullFace(GL_BACK);
    glVertexPointer(asset.vertex.dimension, GL_FLOAT, 0, asset.vertex.verticies);
    glColorPointer(kRGBA, GL_FLOAT, 0, asset.vertex.colors);
    GLfloat tx = asset.transform.position.v[0];
    GLfloat ty = asset.transform.position.v[1];
    GLfloat tz = asset.transform.position.v[2];
    GLfloat sx = asset.transform.scale.v[0];
    GLfloat sy = asset.transform.scale.v[1];
    GLfloat sz = asset.transform.scale.v[2];
    GLfloat rx = asset.transform.rotation.v[0];
    GLfloat ry = asset.transform.rotation.v[1];
    GLfloat rz = asset.transform.rotation.v[2];
    glPushMatrix();
    glTranslatef(tx, ty, tz);
    glScalef(sx, sy, sz);
    glRotatef(rx, 1.0f, 0.0f, 0.0f);
    glRotatef(ry, 0.0f, 1.0f, 0.0f);
    glRotatef(rz, 0.0f, 0.0f, 1.0f);
    glDrawArrays(asset.renderMode, 0, asset.vertex.count);
    glPopMatrix();
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_COLOR_ARRAY);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    return;
}
- (void)present {
    [self.context presentRenderbuffer:GL_RENDERBUFFER_OES];
}
@end
