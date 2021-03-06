// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1MaterialAsset.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1Renderer.h"
@implementation GLES1MaterialAsset
- (id)init {
    return self;
}
- (NSMutableDictionary<NSString*, GLES1Material*>*)create:(NSString*)mtlPath {
    NSMutableDictionary<NSString*, GLES1Material*>* ret = [[NSMutableDictionary<NSString*, GLES1Material*> alloc] init];
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    BOOL exists = [fileManager fileExistsAtPath:mtlPath];
    if (NO == exists) {
        return ret;
    }
    __block GLES1Material* material = nil;
    __block GLES1Color* ambient = nil;
    __block GLES1Color* diffuse = nil;
    __block GLES1Color* specular = nil;
    NSString* dirPath = [mtlPath stringByDeletingLastPathComponent];
    NSString* str = [NSString stringWithContentsOfFile:mtlPath encoding:NSUTF8StringEncoding error:nil];
    [str enumerateLinesUsingBlock:^(NSString* line, BOOL* stop) {
      NSArray* data = [line componentsSeparatedByString:@" "];
      if (1 < data.count) {
          NSString* command = [data objectAtIndex:0];
          command = [command stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
          if (false != [command isEqualToString:@"newmtl"]) {
              NSString* name = [data objectAtIndex:1];
              material = [[GLES1Material alloc] init];
              [material setName:name];
              [ret setObject:material forKey:material.name];
          } else if (false != [command isEqualToString:@"Ka"]) {
              NSNumber* r = [data objectAtIndex:1];
              NSNumber* g = [data objectAtIndex:2];
              NSNumber* b = [data objectAtIndex:3];
              ambient = [[GLES1Color alloc] init];
              ambient.r = [r floatValue];
              ambient.g = [g floatValue];
              ambient.b = [b floatValue];
          } else if (false != [command isEqualToString:@"Kd"]) {
              NSNumber* r = [data objectAtIndex:1];
              NSNumber* g = [data objectAtIndex:2];
              NSNumber* b = [data objectAtIndex:3];
              diffuse = [[GLES1Color alloc] init];
              diffuse.r = [r floatValue];
              diffuse.g = [g floatValue];
              diffuse.b = [b floatValue];
          } else if (false != [command isEqualToString:@"Ks"]) {
              NSNumber* r = [data objectAtIndex:1];
              NSNumber* g = [data objectAtIndex:2];
              NSNumber* b = [data objectAtIndex:3];
              specular = [[GLES1Color alloc] init];
              specular.r = [r floatValue];
              specular.g = [g floatValue];
              specular.b = [b floatValue];
          } else if (false != [command isEqualToString:@"Tf"]) {
              NSNumber* tfa = [data objectAtIndex:1];
              NSNumber* tfd = [data objectAtIndex:2];
              NSNumber* tfs = [data objectAtIndex:3];
              if (nil != ambient) {
                  ambient.a = [tfa floatValue];
                  [material setAmbient:ambient];
              }
              if (nil != diffuse) {
                  diffuse.a = [tfd floatValue];
                  [material setDiffuse:diffuse];
              }
              if (nil != specular) {
                  specular.a = [tfs floatValue];
                  [material setSpecular:specular];
              }
          } else if (false != [command isEqualToString:@"map_Kd"]) {
              NSString* path = [data objectAtIndex:1];
              path = [NSString stringWithFormat:@"%@/%@", dirPath, path];
              [material setDiffuseTexture:path];
          } else if (false != [command isEqualToString:@"map_Ka"]) {
              NSString* path = [data objectAtIndex:1];
              path = [NSString stringWithFormat:@"%@/%@", dirPath, path];
              [material setAmbientTexture:path];
          } else if (false != [command isEqualToString:@"map_Bump"]) {
              NSString* path = [data objectAtIndex:1];
              path = [NSString stringWithFormat:@"%@/%@", dirPath, path];
              [material setNormalTexture:path];
          }
      }
    }];
    return ret;
}
@end
