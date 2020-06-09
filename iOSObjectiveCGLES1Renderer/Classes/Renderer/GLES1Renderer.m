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
#import "StencilBufferObject.h"
@interface GLES1Renderer ()
@property FrameBufferObject* fbo;
@property ColorBufferObject* cbo;
@property DepthBufferObject* dbo;
@property StencilBufferObject* sbo;
@property NSMutableArray<GLES1Light*>* lights;
@property ProjectonTransfomMatrix* projectonTransfomMatrix;
@property ModelViewTransformMatrix* modelViewTransfomMatrix;
@end
@implementation GLES1Renderer
@synthesize context;
@synthesize fbo;
@synthesize cbo;
@synthesize dbo;
@synthesize sbo;
@synthesize lights;
@synthesize projectonTransfomMatrix;
@synthesize modelViewTransfomMatrix;
- (id)init {
    return self;
}
- (void)create {
    self->context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    self->projectonTransfomMatrix = [[ProjectonTransfomMatrix alloc] init];
    self->modelViewTransfomMatrix = [[ModelViewTransformMatrix alloc] init];
    self->lights = [[NSMutableArray alloc] init];
    self->_viewport = [[Viewport alloc] init];
    self->_camera = [[GLES1Camera alloc] init];
    [EAGLContext setCurrentContext:self->context];
    return;
}
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height {
    [self bind:layer width:width height:height attachmentType:GL_DEPTH_ATTACHMENT_OES];
    return;
}
- (void)bind:(CAEAGLLayer*)layer width:(GLint)width height:(GLint)height attachmentType:(GLenum)attachmentType {
    self->fbo = [[FrameBufferObject alloc] init];
    self->cbo = [[ColorBufferObject alloc] init];
    if (GL_DEPTH_ATTACHMENT_OES == attachmentType) {
        self->dbo = [[DepthBufferObject alloc] init];
    } else {
        self->sbo = [[StencilBufferObject alloc] init];
    }
    [self->fbo allocateBuffer];
    [self->cbo allocateBuffer];
    BOOL ret = [self.context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
    if (NO == ret) {
        NSLog(@"faild renderbufferStorage");
        return;
    }
    if (GL_DEPTH_ATTACHMENT_OES == attachmentType) {
        [self->dbo allocateBuffer:width height:height];
    } else {
        [self->sbo allocateBuffer:width height:height];
    }
    GLenum status = glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES);
    if (GL_FRAMEBUFFER_COMPLETE_OES != status) {
        NSLog(@"glCheckFramebufferStatusOES::%x", status);
        return;
    }
}
- (void)delete {
    [EAGLContext setCurrentContext:nil];
    for (GLES1Light* light in self.lights) {
        [light releaseBuffer];
    }
    [self->fbo releaseBuffer];
    [self->cbo releaseBuffer];
    if (nil != self->dbo) {
        [self->dbo releaseBuffer];
    }
    if (nil != self->sbo) {
        [self->sbo releaseBuffer];
    }
    return;
}
- (void)rebind:(CAEAGLLayer*)layer {
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, self->cbo.bufferId);
    GLint width;
    GLint height;
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &width);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &height);
    if (nil != self->dbo) {
        [self->dbo rebind:width height:height];
    }
    if (nil != self->sbo) {
        [self->sbo rebind:width height:height];
    }
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
- (void)render:(BaseWipeAsset*)asset wipeType:(int)wipeType delta:(GLfloat)delta totalTime:(GLfloat)totalTime {
    glEnable(GL_STENCIL_TEST);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    glStencilFunc(GL_ALWAYS, 1, 0xFF);
    glStencilOp(GL_REPLACE, GL_REPLACE, GL_REPLACE);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(asset.vertex.dimension, GL_FLOAT, 0, asset.vertex.verticies);
    glColorPointer(kRGBA, GL_FLOAT, 0, asset.vertex.colors);
    GLfloat scale = 1.0f;
    if (kWipeIn == wipeType) {
        scale = [asset wipeIn:delta totalTime:totalTime];
    } else {
        scale = [asset wipeOut:delta totalTime:totalTime];
    }
    glPushMatrix();
    glTranslatef(0.0, 0.0, 0.0);
    glScalef(scale, scale, scale);
    glDepthMask(GL_FALSE);
    glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE);
    glDrawArrays(GL_TRIANGLES, 0, asset.vertex.count);
    glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
    glDepthMask(GL_TRUE);
    glPopMatrix();
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_COLOR_ARRAY);
    glStencilFunc(GL_EQUAL, 1, 0xFF);
    glStencilOp(GL_KEEP, GL_KEEP, GL_KEEP);
    glDisable(GL_CULL_FACE);
    glDisable(GL_STENCIL_TEST);
    return;
}
- (void)render:(BaseAsset*)asset {
    if (nil == asset.blend) {
        glEnable(GL_DEPTH_TEST);
    } else {
        glEnable(GL_BLEND);
    }
    if (nil != self->sbo) {
        glEnable(GL_STENCIL_TEST);
    }
    glEnable(GL_CULL_FACE);
    if (nil != self->_fog) {
        glEnable(GL_FOG);
    }
    if (nil != asset.texture) {
        glEnable(GL_TEXTURE_2D);
        if (nil != asset.blend) {
            glEnable(GL_ALPHA_TEST);
        }
    } else if (nil != asset.material && NO != asset.material.hasTexture) {
        [asset.material enable];
        if (nil != asset.blend) {
            glEnable(GL_ALPHA_TEST);
        }
    }
    if (0 < self.lights.count) {
        glEnable(GL_NORMALIZE);
        glEnable(GL_LIGHTING);
        if (nil == asset.material) {
            glEnable(GL_COLOR_MATERIAL);
        }
        for (GLES1Light* light in self.lights) {
            [light enable];
        }
    }
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);
    if (nil != asset.texture) {
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    }
    if (0 < self.lights.count) {
        glEnableClientState(GL_NORMAL_ARRAY);
    }
    glCullFace(GL_BACK);
    for (GLES1Light* light in self.lights) {
        [light illuminate];
    }
    if (nil != asset.blend) {
        glBlendFunc(asset.blend.source, asset.blend.destination);
    }
    glVertexPointer(asset.vertex.dimension, GL_FLOAT, 0, asset.vertex.verticies);
    glColorPointer(kRGBA, GL_FLOAT, 0, asset.vertex.colors);
    if (nil != asset.texture) {
        glTexCoordPointer(2, GL_FLOAT, 0, asset.vertex.uvs);
        glBindTexture(GL_TEXTURE_2D, asset.texture.textureId);
        if (nil != asset.blend) {
            glAlphaFunc(asset.texture.alphaComparisonFunction, asset.texture.alphaReferenceValue);
        }
    }
    if (nil != asset.material) {
        [asset.material setUVs:asset.vertex.uvs];
    }
    if (0 < self.lights.count) {
        glNormalPointer(GL_FLOAT, 0, asset.vertex.normals);
    }
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
    if (nil != self->_fog) {
        [self->_fog mist];
    }
    if (nil != asset.shader) {
        [asset.shader shade];
    }
    if (nil != asset.material) {
        [asset.material reflect];
    }
    if (nil == asset.vertex.indicies) {
        glDrawArrays(asset.renderMode, 0, asset.vertex.count);
    } else {
        glDrawElements(asset.renderMode, asset.vertex.indexCount, GL_UNSIGNED_SHORT, asset.vertex.indicies);
    }
    glPopMatrix();
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_COLOR_ARRAY);
    if (0 < self.lights.count) {
        glDisableClientState(GL_NORMAL_ARRAY);
        for (GLES1Light* light in self.lights) {
            [light disable];
        }
        if (nil == asset.material) {
            glDisable(GL_COLOR_MATERIAL);
        }
        glDisable(GL_LIGHTING);
    }
    if (nil != asset.texture) {
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        glDisable(GL_TEXTURE_2D);
        if (nil != asset.blend) {
            glDisable(GL_ALPHA_TEST);
        }
    } else if (nil != asset.material && NO != asset.material.hasTexture) {
        [asset.material disable];
        if (nil != asset.blend) {
            glDisable(GL_ALPHA_TEST);
        }
    }
    if (nil != self->_fog) {
        glDisable(GL_FOG);
    }
    glDisable(GL_CULL_FACE);
    if (nil != self->sbo) {
        glDisable(GL_STENCIL_TEST);
    }
    if (nil == asset.blend) {
        glDisable(GL_DEPTH_TEST);
    } else {
        glDisable(GL_BLEND);
    }
    return;
}
- (void)present {
    [self.context presentRenderbuffer:GL_RENDERBUFFER_OES];
}
- (void)addLight:(GLES1Light*)light {
    if (GL_MAX_LIGHTS < self.lights.count) {
        return;
    }
    [self.lights addObject:light];
    return;
}
- (void)setFog:(GLES1Fog*)fog {
    self->_fog = fog;
    return;
}
@end
