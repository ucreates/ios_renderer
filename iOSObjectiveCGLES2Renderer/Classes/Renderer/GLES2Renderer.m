// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Renderer.h"
#import <Foundation/Foundation.h>
#import "GLES2ProjectonTransfomMatrix.h"
#import "GLES2ViewTransformMatrix.h"
@interface GLES2Renderer ()
@property GLES2ProjectonTransfomMatrix* projectonTransfomMatrix;
@property GLES2ViewTransformMatrix* viewTransfomMatrix;
@end
@implementation GLES2Renderer
@synthesize context;
@synthesize projectonTransfomMatrix;
@synthesize viewTransfomMatrix;
- (id)init {
    return self;
}
- (void)create {
    self->context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    self->projectonTransfomMatrix = [[GLES2ProjectonTransfomMatrix alloc] init];
    self->viewTransfomMatrix = [[GLES2ViewTransformMatrix alloc] init];
    self->_viewport = [[GLES2Viewport alloc] init];
    self->_camera = [[GLES2Camera alloc] init];
    [EAGLContext setCurrentContext:self->context];
    return;
}
- (void)rebind:(CAEAGLLayer*)layer {
}
- (void)dispose {
    return;
}
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height {
    [self->_viewport setScreenSize:width height:height];
    return;
}
- (void)clear {
    [self->_viewport update:self.camera];
    return;
}
- (void)transform:(int)dimension {
    [EAGLContext setCurrentContext:self.context];
    if (kDimension2D == dimension) {
        GLfloat aspectRatio = [self->_viewport getAspectRatio];
        GLfloat near = self->_camera.orthoNear;
        GLfloat far = self->_camera.orthoFar;
        self->_projectionMatrix = [self->projectonTransfomMatrix transform2D:aspectRatio near:near far:far];
        self->_viewMatrix = [self->viewTransfomMatrix transform2D];
    } else {
        GLfloat aspectRatio = [self->_viewport getAspectRatio];
        GLfloat fov = self->_camera.fov;
        GLfloat near = self->_camera.perspectiveNear;
        GLfloat far = self->_camera.perspectiveFar;
        GLKVector3 eye = self->_camera.eye;
        GLKVector3 center = self->_camera.center;
        GLKVector3 up = self->_camera.up;
        self->_projectionMatrix = [self->projectonTransfomMatrix transform3D:fov aspectRatio:aspectRatio near:near far:far];
        self->_viewMatrix = [self->viewTransfomMatrix transform3D:eye center:center up:up];
    }
    return;
}
- (void)render:(GLES2BaseAsset*)asset delta:(NSTimeInterval)delta {
    glUseProgram(asset.po.handle);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    GLKMatrix4 modelMatrix = [asset.transform getMatrix];
    [GLES2Shader setUniformMatrix4fv:self->_projectionAttributeName programObjectHandle:asset.po.handle value:self->_projectionMatrix];
    [GLES2Shader setUniformMatrix4fv:self->_viewAttributeName programObjectHandle:asset.po.handle value:self->_viewMatrix];
    [GLES2Shader setUniformMatrix4fv:self->_modelAttributeName programObjectHandle:asset.po.handle value:modelMatrix];
    [asset bind:delta];
    if (0 < asset.vertex.indexCount) {
        glDrawElements(asset.renderType, asset.vertex.indexCount, GL_UNSIGNED_SHORT, nil);
    } else {
        glDrawArrays(asset.renderType, 0, asset.vertex.count);
    }
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    glUseProgram(0);
    return;
}
- (void)setProjectionMatrixAttributeName:(NSString*)projectionAttributeName {
    self->_projectionAttributeName = projectionAttributeName;
    return;
}
- (void)setModelMatrixAttributeName:(NSString*)modelAttributeName {
    self->_modelAttributeName = modelAttributeName;
    return;
}
- (void)setViewMatrixAttributeName:(NSString*)viewAttributeName {
    self->_viewAttributeName = viewAttributeName;
    return;
}
@end
