// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2Shader.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@interface GLES2Shader ()
@end
@implementation GLES2Shader
- (id)init {
    return self;
}
- (void)dispose {
    if (-1 == self->_handle) {
        glDeleteShader(self->_handle);
    }
    return;
}
- (void)compile {
    NSError* error;
    NSString* text = [[NSString alloc] initWithContentsOfFile:self->_path encoding:NSUTF8StringEncoding error:&error];
    const char* src = text.UTF8String;
    const GLint length = (GLint)text.length;
    GLuint handle = glCreateShader(self->_shaderType);
    glShaderSource(handle, 1, &src, &length);
    glCompileShader(handle);
    GLint status = 0;
    glGetShaderiv(handle, GL_COMPILE_STATUS, &status);
    if (GL_FALSE == status) {
        GLint infoLogLength = 0;
        glGetShaderiv(handle, GL_INFO_LOG_LENGTH, &infoLogLength);
        if (infoLogLength > 0) {
            char* infoLog = (char*)malloc(sizeof(char) * infoLogLength);
            glGetShaderInfoLog(handle, infoLogLength, NULL, infoLog);
            NSLog(@"Compile error: %s", infoLog);
            free(infoLog);
        } else {
            NSLog(@"Unknown compile error.");
        }
    }
    self->_handle = handle;
    return;
}
- (void)setPath:(NSString*)path {
    self->_path = path;
    return;
}
- (void)setType:(GLenum)type {
    self->_shaderType = type;
    return;
}
+ (void)setAttribPointer:(NSString*)attribName programObjectHandle:(GLuint)programObjectHandle pointer:(GLvoid*)pointer {
    const char* name = (char*)[attribName UTF8String];
    GLint location = glGetAttribLocation(programObjectHandle, name);
    glEnableVertexAttribArray(location);
    glVertexAttribPointer(location, 1, GL_FLOAT, GL_FALSE, 0, pointer);
    return;
}
+ (void)setUniform1i:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLint)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform1i(location, value);
    return;
}
+ (void)setUniform1f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLfloat)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform1f(location, value);
    return;
}
+ (void)setUniform3f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value1:(GLfloat)value1 value2:(GLfloat)value2 value3:(GLfloat)value3 {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform3f(location, value1, value2, value3);
    return;
}
+ (void)setUniform3fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle length:(int)length value:(GLfloat*)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform3fv(location, length, value);
    return;
}
+ (void)setUniformMatrix3fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLKMatrix3)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniformMatrix3fv(location, 1, GL_FALSE, value.m);
    return;
}
+ (void)setUniform4f:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value1:(GLfloat)value1 value2:(GLfloat)value2 value3:(GLfloat)value3 value4:(GLfloat)value4 {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform4f(location, value1, value2, value3, value4);
    return;
}
+ (void)setUniform4fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle length:(int)length value:(GLfloat*)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniform4fv(location, length, value);
    return;
}
+ (void)setUniformMatrix4fv:(NSString*)uniformName programObjectHandle:(GLuint)programObjectHandle value:(GLKMatrix4)value {
    const char* name = (char*)[uniformName UTF8String];
    GLint location = glGetUniformLocation(programObjectHandle, name);
    glUniformMatrix4fv(location, 1, GL_FALSE, value.m);
    return;
}
- (GLuint)handle {
    return self->_handle;
}
@end
