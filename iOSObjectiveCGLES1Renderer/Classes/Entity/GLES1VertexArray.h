// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1VertexArray_h
#define GLES1VertexArray_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface GLES1VertexArray : NSObject {
    int _dimension;
    int _vertexCount;
    int _vertexColorCount;
    int _indexCount;
    GLfloat* _verticies;
    GLfloat* _colors;
    GLfloat* _normals;
    GLfloat* _uvs;
    GLushort* _indicies;
}
@property(readonly) int dimension;
@property(readonly) int count;
@property(readonly) int indexCount;
@property(readonly) GLfloat* verticies;
@property(readonly) GLfloat* colors;
@property(readonly) GLfloat* normals;
@property(readonly) GLfloat* uvs;
@property(readonly) GLushort* indicies;
- (id)init:(int)dimension;
- (void)releaseBuffer;
- (void)releaseUVBuffer;
- (void)setVertexCount:(int)count;
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount;
- (void)setVerticies:(NSMutableArray*)verticies;
- (void)setColors:(GLfloat*)vertexColors vertexColorsCount:(int)vertexColorsCount;
- (void)setColors:(NSMutableArray*)colors;
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount;
- (void)setNormals:(NSMutableArray*)normals;
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
- (void)setUVs:(NSMutableArray*)uvs;
- (void)setIndicies:(GLushort*)indicies indiciesCount:(int)indiciesCount;
- (void)setIndicies:(NSMutableArray*)indicies;
- (void)setRandomColor;
- (void)setAlpha:(GLfloat)alpha;
- (void)resetUVs:(GLfloat*)uvs;
@end
#endif /* GLES1VertexArray_h */
