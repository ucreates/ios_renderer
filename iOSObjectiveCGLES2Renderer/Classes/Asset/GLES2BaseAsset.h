// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2019 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2BaseAsset_h
#define GLES2BaseAsset_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Color.h"
#import "GLES2TextureAsset.h"
#import "GLES2Transform.h"
#import "GLES2Vertex.h"
static const int kUVCount = 2;
static const int kTriangleVertexCount = 3;
static const int kRectangleVertexCount = 4;
typedef void (^bindCallBack)(double);
@interface GLES2BaseAsset : NSObject {
    GLfloat _width;
    GLfloat _height;
    GLfloat _depth;
    bindCallBack _callback;
    GLES2ProgramObject* _po;
    GLES2Vertex* _vertex;
    GLES2Color* _color;
    GLES2TextureAsset* _texture;
}
@property GLES2Transform* transform;
@property(readonly) GLenum renderType;
@property(readonly) GLES2ProgramObject* po;
@property(readonly) GLES2Vertex* vertex;
@property(readonly) GLES2TextureAsset* texture;
- (id)init;
- (void)create;
- (void)create:(NSString*)texturePath textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber;
- (void)create:(NSString*)texturePath textureUnit:(GLenum)textureUnit textureUnitName:(NSString*)textureUnitName textureUnitNumber:(int)textureUnitNumber;
- (void)bind:(double)delta;
- (void)setProgramObject:(GLES2ProgramObject*)programObject;
- (void)setBindCallback:(bindCallBack)callback;
@end
#endif /* GLES2BaseAsset_h */
