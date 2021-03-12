// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2BaseVertexBufferObject_h
#define GLES2BaseVertexBufferObject_h
#import "GLES2BaseBufferObject.h"
#import "GLES2ProgramObject.h"
@interface GLES2BaseVertexBufferObject : GLES2BaseBufferObject {
    int _dimension;
    int _count;
    int _vertexCount;
    int _colorsCount;
    int _uvsCount;
    int _normalsCount;
    int _elementsCount;
    int _elementsCountPerVertex;
    GLuint _stride;
    GLfloat* _elements;
    GLfloat* _verticies;
    GLfloat* _colors;
    GLfloat* _uvs;
    GLfloat* _normals;
}
@property(readonly) int dimension;
@property(readonly) int count;
@property(readonly) GLuint stride;
@property(readonly) GLfloat* elements;
- (id)init:(int)dimension;
- (void)setVertexCount:(int)count;
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount;
- (void)setColors:(GLfloat*)colors colorsCount:(int)colorsCount;
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount;
- (void)setRandomColor:(NSString*)uniformName programObject:(GLES2ProgramObject*)programObject;
- (void)bind:(GLES2ProgramObject*)programObject;
- (void)allocateBuffer;
@end
#endif /* GLES2BaseVertexBufferObject_h */
