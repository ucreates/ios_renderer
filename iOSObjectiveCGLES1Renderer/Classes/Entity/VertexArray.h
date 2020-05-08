// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef VertexArray_h
#define VertexArray_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
@interface VertexArray : NSObject {
    int _dimension;
    int _vertexCount;
    int _vertexColorCount;
    GLfloat* _verticies;
    GLfloat* _colors;
    GLfloat* _normals;
    GLfloat* _uvs;
}
@property(readonly) int dimension;
@property(readonly) int count;
@property(readonly) GLfloat* verticies;
@property(readonly) GLfloat* colors;
@property(readonly) GLfloat* normals;
@property(readonly) GLfloat* uvs;
- (id)init:(int)dimension;
- (void)releaseBuffer;
- (void)setVertexCount:(int)count;
- (void)setVerticies:(GLfloat*)verticies verticiesCount:(int)verticiesCount;
- (void)setVerticies:(NSMutableArray*)verticies;
- (void)setColors:(GLfloat*)vertexColors vertexColorsCount:(int)vertexColorsCount;
- (void)setColors:(NSMutableArray*)colors;
- (void)setNormals:(GLfloat*)normals normalsCount:(int)normalsCount;
- (void)setNormals:(NSMutableArray*)normals;
- (void)setUVs:(GLfloat*)uvs uvsCount:(int)uvsCount;
- (void)setUVs:(NSMutableArray*)uvs;
- (void)setRandomColor;
- (void)setAlpha:(GLfloat)alpha;
@end
#endif /* VertexArray_h */
