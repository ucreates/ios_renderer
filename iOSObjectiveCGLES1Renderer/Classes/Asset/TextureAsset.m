// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "TextureAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Exponentiation.h"
#import "GLES1Renderer.h"
@implementation TextureAsset
- (id)init {
    self->_alphaComparisonFunction = GL_GREATER;
    self->_alphaReferenceValue = 0.1f;
    return self;
}
- (void)load:(NSString*)path {
    UIImage* image = [UIImage imageNamed:path];
    CGImageRef imageRef = image.CGImage;
    if (nil == imageRef) {
        NSLog(@"imageref is nil");
        return;
    }
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    GLuint edge = width >= height ? (GLuint)width : (GLuint)height;
    edge = [GLES1Exponentiation getExponentiation:edge];
    size_t fileSize = edge * edge * kRGBA;
    size_t stride = edge * kRGBA;
    GLubyte* textureData = (GLubyte*)malloc(fileSize);
    CGColorSpaceRef colorSpaceRef = CGImageGetColorSpace(imageRef);
    CGContextRef context = CGBitmapContextCreate(textureData, edge, edge, 8, stride, colorSpaceRef, kCGImageAlphaPremultipliedLast);
    CGRect rect = CGRectMake(0, 0, (CGFloat)width, (CGFloat)height);
    CGContextDrawImage(context, rect, imageRef);
    CGContextRelease(context);
    GLuint tid;
    glGenTextures(1, &tid);
    glBindTexture(GL_TEXTURE_2D, tid);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, (CGFloat)edge, (CGFloat)edge, 0, GL_RGBA, GL_UNSIGNED_BYTE, textureData);
    free(textureData);
    GLfloat widthRate = (GLfloat)width / (GLfloat)edge;
    GLfloat heightRate = (GLfloat)height / (GLfloat)edge;
    self->_textureId = tid;
    self->_size = CGSizeMake(width, height);
    self->_uvRatio = CGSizeMake(widthRate, heightRate);
    return;
}
- (void)loadMipmap:(NSMutableArray<NSString*>*)paths {
    size_t width = 0;
    size_t height = 0;
    GLuint edge = 0;
    GLuint tid;
    glGenTextures(1, &tid);
    glBindTexture(GL_TEXTURE_2D, tid);
    for (int i = 0; i < paths.count; i++) {
        NSString* path = [paths objectAtIndex:i];
        UIImage* image = [UIImage imageNamed:path];
        CGImageRef imageRef = image.CGImage;
        if (nil == imageRef) {
            NSLog(@"imageref is nil");
            return;
        }
        size_t tmpWidth = CGImageGetWidth(imageRef);
        size_t tmpHeight = CGImageGetHeight(imageRef);
        GLuint tmpEdge = tmpWidth >= tmpHeight ? (GLuint)tmpWidth : (GLuint)tmpHeight;
        tmpEdge = [GLES1Exponentiation getExponentiation:tmpEdge];
        width = 0 == width ? tmpWidth : width;
        height = 0 == height ? tmpHeight : height;
        edge = 0 == edge ? tmpEdge : edge;
        size_t fileSize = tmpEdge * tmpEdge * kRGBA;
        size_t stride = tmpEdge * kRGBA;
        GLubyte* textureData = (GLubyte*)malloc(fileSize);
        CGColorSpaceRef colorSpaceRef = CGImageGetColorSpace(imageRef);
        CGContextRef context = CGBitmapContextCreate(textureData, tmpEdge, tmpEdge, 8, stride, colorSpaceRef, kCGImageAlphaPremultipliedLast);
        CGRect rect = CGRectMake(0, 0, (CGFloat)tmpWidth, (CGFloat)tmpHeight);
        CGContextDrawImage(context, rect, imageRef);
        CGContextRelease(context);
        glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_TRUE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST_MIPMAP_NEAREST);
        glTexImage2D(GL_TEXTURE_2D, i, GL_RGBA, (CGFloat)tmpEdge, (CGFloat)tmpEdge, 0, GL_RGBA, GL_UNSIGNED_BYTE, textureData);
        free(textureData);
    }
    GLfloat widthRate = (GLfloat)width / (GLfloat)edge;
    GLfloat heightRate = (GLfloat)height / (GLfloat)edge;
    self->_textureId = tid;
    self->_size = CGSizeMake(width, height);
    self->_uvRatio = CGSizeMake(widthRate, heightRate);
    return;
}
- (void)releaseBuffer {
    glDeleteTextures(1, &self->_textureId);
    return;
}
- (void)setAlphaComparisonFunction:(GLenum)func {
    self->_alphaComparisonFunction = func;
    return;
}
- (void)setAlphaReferenceValue:(GLclampf)value {
    self->_alphaReferenceValue = value;
    return;
}
- (GLuint)textureId {
    return self->_textureId;
}
- (CGSize)size {
    return self->_size;
}
- (CGSize)uvRatio {
    return self->_uvRatio;
}
- (GLenum)alphaComparisonFunction {
    return self->_alphaComparisonFunction;
}
- (GLclampf)alphaReferenceValue {
    return self->_alphaReferenceValue;
}
@end
