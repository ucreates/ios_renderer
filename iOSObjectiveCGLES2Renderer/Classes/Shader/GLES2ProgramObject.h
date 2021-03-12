//
//  ProgramObject.h
//  renderer
//
//  Created by Kotaro Masamoto on 2020/03/10.
//  Copyright © 2020 Kotaro Masamoto. All rights reserved.
//
#ifndef GLES2ProgramObject_h
#define GLES2ProgramObject_h
#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import "GLES2Shader.h"
@interface GLES2ProgramObject : NSObject {
    GLuint _handle;
    GLint _positionLocation;
    GLint _colorLocation;
    GLint _uvLocation;
    GLint _normalLocation;
    NSString* _positionName;
    NSString* _colorName;
    NSString* _uvName;
    NSString* _normalName;
    GLES2Shader* _vertexShader;
    GLES2Shader* _fragmentShader;
}
@property(readonly) GLuint handle;
@property(readonly) GLint positionLocation;
@property(readonly) GLint colorLocation;
@property(readonly) GLint uvLocation;
@property(readonly) GLint normalLocation;
- (id)init;
- (void)link;
- (void)setPositionName:(NSString*)positionName;
- (void)setColorName:(NSString*)colorName;
- (void)setUVName:(NSString*)uvName;
- (void)setNormalName:(NSString*)normalName;
- (void)setVertexShader:(NSString*)path;
- (void)setFragmentShader:(NSString*)path;
@end
#endif /* GLES2ProgramObject_h */
