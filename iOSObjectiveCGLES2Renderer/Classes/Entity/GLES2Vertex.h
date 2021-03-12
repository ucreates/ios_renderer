// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Vertex_h
#define GLES2Vertex_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2ProgramObject.h"
#import "GLES2VertexArrayObject.h"
#import "GLES2VertexBufferObject.h"
static const int kVBO = 1;
static const int kVAO = 2;
@interface GLES2Vertex : NSObject {
    GLES2BaseVertexBufferObject* _vo;
}
@property(readonly) int dimension;
@property(readonly) int count;
@property(readonly) GLfloat* verticies;
@property(readonly) GLfloat* colors;
- (id)init:(int)dimension bufferType:(int)bufferType;
- (void)releaseBuffer;
- (void)allocateBuffer;
- (void)setVertexCount:(int)count;
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount;
- (void)setColors:(GLfloat*)colors colorsCount:(int)colorsCount;
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount;
- (void)setRandomColor:(NSString*)uniformName programObject:(GLES2ProgramObject*)programObject;
- (void)bind:(GLES2ProgramObject*)programObject;
@end
#endif /* GLES2Vertex_h */
