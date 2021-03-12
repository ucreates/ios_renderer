// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES2ProgramObject.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
@interface GLES2ProgramObject ()
@end
@implementation GLES2ProgramObject
- (id)init {
    self->_vertexShader = nil;
    return self;
}
- (void)link {
    GLint linkStatus = 0;
    if (nil == self->_vertexShader) {
        NSLog(@"vertex shader not found.");
        return;
    }
    if (nil == self->_fragmentShader) {
        NSLog(@"fragment shader not found.");
        return;
    }
    [self->_vertexShader compile];
    [self->_fragmentShader compile];
    GLuint pohandle = glCreateProgram();
    glAttachShader(pohandle, self->_vertexShader.handle);
    glAttachShader(pohandle, self->_fragmentShader.handle);
    if (0 != self->_positionName.length) {
        const char* pname = (char*)[self->_positionName UTF8String];
        glBindAttribLocation(pohandle, GLKVertexAttribPosition, pname);
    }
    if (0 != self->_colorName.length) {
        const char* cname = (char*)[self->_colorName UTF8String];
        glBindAttribLocation(pohandle, GLKVertexAttribColor, cname);
    }
    if (0 != self->_uvName.length) {
        const char* cname = (char*)[self->_uvName UTF8String];
        glBindAttribLocation(pohandle, GLKVertexAttribTexCoord0, cname);
    }
    if (0 != self->_normalName.length) {
        const char* cname = (char*)[self->_normalName UTF8String];
        glBindAttribLocation(pohandle, GLKVertexAttribNormal, cname);
    }
    glLinkProgram(pohandle);
    glGetProgramiv(pohandle, GL_LINK_STATUS, &linkStatus);
    if (GL_FALSE == linkStatus) {
        GLint infoLogLength = 0;
        glGetProgramiv(pohandle, GL_INFO_LOG_LENGTH, &infoLogLength);
        if (infoLogLength > 0) {
            char* infoLog = (char*)malloc(sizeof(char) * infoLogLength);
            glGetProgramInfoLog(pohandle, infoLogLength, NULL, infoLog);
            glDeleteProgram(pohandle);
            NSLog(@"Compile error: %s", infoLog);
            free(infoLog);
        } else {
            NSLog(@"Unknown compile error.");
        }
        return;
    }
    if (0 != self->_positionName.length) {
        const char* pname = (char*)[self->_positionName UTF8String];
        self->_positionLocation = glGetAttribLocation(pohandle, pname);
    }
    if (0 != self->_colorName.length) {
        const char* cname = (char*)[self->_colorName UTF8String];
        self->_colorLocation = glGetAttribLocation(pohandle, cname);
    }
    if (0 != self->_uvName.length) {
        const char* cname = (char*)[self->_uvName UTF8String];
        self->_uvLocation = glGetAttribLocation(pohandle, cname);
    }
    if (0 != self->_normalName.length) {
        const char* cname = (char*)[self->_normalName UTF8String];
        self->_normalLocation = glGetAttribLocation(pohandle, cname);
    }
    self->_handle = pohandle;
    [self->_vertexShader dispose];
    [self->_fragmentShader dispose];
    return;
}
- (void)setVertexShader:(NSString*)path {
    self->_vertexShader = [[GLES2Shader alloc] init];
    [self->_vertexShader setPath:path];
    [self->_vertexShader setType:GL_VERTEX_SHADER];
    return;
}
- (void)setFragmentShader:(NSString*)path {
    self->_fragmentShader = [[GLES2Shader alloc] init];
    [self->_fragmentShader setPath:path];
    [self->_fragmentShader setType:GL_FRAGMENT_SHADER];
    return;
}
- (void)setPositionName:(NSString*)positionName {
    self->_positionName = positionName;
    return;
}
- (void)setColorName:(NSString*)colorName {
    self->_colorName = colorName;
    return;
}
- (void)setUVName:(NSString*)uvName {
    self->_uvName = uvName;
    return;
}
- (void)setNormalName:(NSString*)normalName {
    self->_normalName = normalName;
    return;
}
- (GLuint)handle {
    return self->_handle;
}
- (GLint)positionLocation {
    return self->_positionLocation;
}
- (GLint)colorLocation {
    return self->_colorLocation;
}
- (GLint)uvLocation {
    return self->_uvLocation;
}
- (GLint)normalLocation {
    return self->_normalLocation;
}
@end
