// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES2Shader_h
#define GLES2Shader_h
#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@interface GLES2Shader : NSObject {
    NSString* _path;
    GLenum _shaderType;
    GLuint _handle;
}
@property(readonly) GLuint handle;
- (id)init;
- (void)compile;
- (void)dispose;
- (void)setPath:(NSString*)path;
- (void)setType:(GLenum)type;
+ (void)setAttribPointer:(NSString*)attribName programObjectHandle:(GLuint)programObjectHandle pointer:(GLvoid*)pointer;
+ (void)setUniform1i:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLint)value;
+ (void)setUniform1f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLfloat)value;
+ (void)setUniform3f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value1:(GLfloat)value1 value2:(GLfloat)value2 value3:(GLfloat)value3;
+ (void)setUniform3fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle length:(int)length value:(GLfloat*)value;
+ (void)setUniformMatrix3fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLKMatrix3)value;
+ (void)setUniform4f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value1:(GLfloat)value1 value2:(GLfloat)value2 value3:(GLfloat)value3 value4:(GLfloat)value4;
+ (void)setUniform4fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle length:(int)length value:(GLfloat*)value;
+ (void)setUniformMatrix4fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLKMatrix4)value;
@end
#endif /* GLES2Shader_h */
