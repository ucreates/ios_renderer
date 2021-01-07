// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#import "GLES1ObjAsset.h"
#import "GLES1Angle.h"
#import "GLES1MaterialAsset.h"
#import "GLES1Renderer.h"
@interface GLES1ObjAsset ()
@end
@implementation GLES1ObjAsset
- (id)init {
    self = [super init];
    self->_vertex = [[GLES1VertexArray alloc] init:kDimension3D];
    self->_subMeshes = [[NSMutableArray<GLES1Mesh*> alloc] init];
    return self;
}
- (void)create:(NSString*)objPath {
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    BOOL exists = [fileManager fileExistsAtPath:objPath];
    if (NO == exists) {
        return;
    }
    __block int vertexCount = 0;
    __block GLES1Mesh* mesh = nil;
    NSMutableArray<NSNumber*>* vertexOriginArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* uvOriginArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* normalOriginArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* GLES1VertexArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* colorArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* normalArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSMutableArray<NSNumber*>* uvArray = [[NSMutableArray<NSNumber*> alloc] init];
    NSString* content = [NSString stringWithContentsOfFile:objPath encoding:NSUTF8StringEncoding error:nil];
    [content enumerateLinesUsingBlock:^(NSString* line, BOOL* stop) {
      NSArray* data = [line componentsSeparatedByString:@" "];
      if (1 < data.count) {
          NSString* command = [data objectAtIndex:0];
          if (false != [command isEqualToString:@"g"]) {
              NSString* name = [data objectAtIndex:1];
              if (false != [name isEqualToString:@"default"]) {
                  [self addSubMesh:mesh GLES1VertexArray:GLES1VertexArray colorArray:colorArray normalArray:normalArray uvArray:uvArray vertexCount:vertexCount];
                  vertexCount = 0;
                  [GLES1VertexArray removeAllObjects];
                  [colorArray removeAllObjects];
                  [normalArray removeAllObjects];
                  [uvArray removeAllObjects];
              } else {
                  mesh = [[GLES1Mesh alloc] init];
                  [mesh setName:name];
              }
          } else if (false != [command isEqualToString:@"usemtl"]) {
              NSString* usemtl = [data objectAtIndex:1];
              [mesh setUseMaterial:usemtl];
          } else if (false != [command isEqualToString:@"mtllib"]) {
              NSString* dirPath = [objPath stringByDeletingLastPathComponent];
              NSString* path = [data objectAtIndex:1];
              path = [NSString stringWithFormat:@"%@/%@", dirPath, path];
              GLES1MaterialAsset* materialAsset = [[GLES1MaterialAsset alloc] init];
              self->_materials = [materialAsset create:path];
          } else if (false != [command isEqualToString:@"v"]) {
              NSNumber* x = [data objectAtIndex:1];
              NSNumber* y = [data objectAtIndex:2];
              NSNumber* z = [data objectAtIndex:3];
              [vertexOriginArray addObject:x];
              [vertexOriginArray addObject:y];
              [vertexOriginArray addObject:z];
          } else if (false != [command isEqualToString:@"vt"]) {
              NSNumber* u = [data objectAtIndex:1];
              NSNumber* v = [data objectAtIndex:2];
              [uvOriginArray addObject:u];
              [uvOriginArray addObject:v];
              if (4 == data.count) {
                  NSNumber* w = [data objectAtIndex:3];
                  [uvOriginArray addObject:w];
              }
          } else if (false != [command isEqualToString:@"vn"]) {
              NSNumber* x = [data objectAtIndex:1];
              NSNumber* y = [data objectAtIndex:2];
              NSNumber* z = [data objectAtIndex:3];
              [normalOriginArray addObject:x];
              [normalOriginArray addObject:y];
              [normalOriginArray addObject:z];
          } else if (false != [command isEqualToString:@"f"]) {
              NSMutableArray<NSNumber*>* tmpGLES1VertexArray = [[NSMutableArray<NSNumber*> alloc] init];
              NSMutableArray<NSNumber*>* tmpNormalArray = [[NSMutableArray<NSNumber*> alloc] init];
              NSMutableArray<NSNumber*>* tmpUvArray = [[NSMutableArray<NSNumber*> alloc] init];
              for (int i = 1; i < data.count; i++) {
                  NSArray* indexes = [[data objectAtIndex:i] componentsSeparatedByString:@"/"];
                  NSNumber* vertex = [indexes objectAtIndex:0];
                  NSNumber* uv = [indexes objectAtIndex:1];
                  NSNumber* normal = [indexes objectAtIndex:2];
                  [tmpGLES1VertexArray addObject:vertex];
                  [tmpUvArray addObject:uv];
                  [tmpNormalArray addObject:normal];
              }
              if (3 == tmpGLES1VertexArray.count) {
                  NSNumber* t1 = [tmpGLES1VertexArray objectAtIndex:0];
                  NSNumber* t2 = [tmpGLES1VertexArray objectAtIndex:1];
                  NSNumber* t3 = [tmpGLES1VertexArray objectAtIndex:2];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  tidx1 *= 3;
                  tidx2 *= 3;
                  tidx3 *= 3;
                  NSNumber* x1 = [vertexOriginArray objectAtIndex:tidx1];
                  NSNumber* y1 = [vertexOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* z1 = [vertexOriginArray objectAtIndex:tidx1 + 2];
                  NSNumber* x2 = [vertexOriginArray objectAtIndex:tidx2];
                  NSNumber* y2 = [vertexOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* z2 = [vertexOriginArray objectAtIndex:tidx2 + 2];
                  NSNumber* x3 = [vertexOriginArray objectAtIndex:tidx3];
                  NSNumber* y3 = [vertexOriginArray objectAtIndex:tidx3 + 1];
                  NSNumber* z3 = [vertexOriginArray objectAtIndex:tidx3 + 2];
                  [GLES1VertexArray addObject:x1];
                  [GLES1VertexArray addObject:y1];
                  [GLES1VertexArray addObject:z1];
                  [GLES1VertexArray addObject:x2];
                  [GLES1VertexArray addObject:y2];
                  [GLES1VertexArray addObject:z2];
                  [GLES1VertexArray addObject:x3];
                  [GLES1VertexArray addObject:y3];
                  [GLES1VertexArray addObject:z3];
                  int count = 3 * kRGBA;
                  for (int i = 0; i < count; i++) {
                      NSNumber* color = [NSNumber numberWithFloat:1.0f];
                      [colorArray addObject:color];
                  }
                  vertexCount += 3;
              } else if (4 == tmpGLES1VertexArray.count) {
                  NSNumber* t1 = [tmpGLES1VertexArray objectAtIndex:0];
                  NSNumber* t2 = [tmpGLES1VertexArray objectAtIndex:1];
                  NSNumber* t3 = [tmpGLES1VertexArray objectAtIndex:2];
                  NSNumber* t4 = [tmpGLES1VertexArray objectAtIndex:3];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  int tidx4 = [t4 intValue] - 1;
                  tidx1 *= 3;
                  tidx2 *= 3;
                  tidx3 *= 3;
                  tidx4 *= 3;
                  NSNumber* x1 = [vertexOriginArray objectAtIndex:tidx1];
                  NSNumber* y1 = [vertexOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* z1 = [vertexOriginArray objectAtIndex:tidx1 + 2];
                  NSNumber* x2 = [vertexOriginArray objectAtIndex:tidx2];
                  NSNumber* y2 = [vertexOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* z2 = [vertexOriginArray objectAtIndex:tidx2 + 2];
                  NSNumber* x3 = [vertexOriginArray objectAtIndex:tidx3];
                  NSNumber* y3 = [vertexOriginArray objectAtIndex:tidx3 + 1];
                  NSNumber* z3 = [vertexOriginArray objectAtIndex:tidx3 + 2];
                  NSNumber* x4 = [vertexOriginArray objectAtIndex:tidx4];
                  NSNumber* y4 = [vertexOriginArray objectAtIndex:tidx4 + 1];
                  NSNumber* z4 = [vertexOriginArray objectAtIndex:tidx4 + 2];
                  [GLES1VertexArray addObject:x1];
                  [GLES1VertexArray addObject:y1];
                  [GLES1VertexArray addObject:z1];
                  [GLES1VertexArray addObject:x2];
                  [GLES1VertexArray addObject:y2];
                  [GLES1VertexArray addObject:z2];
                  [GLES1VertexArray addObject:x4];
                  [GLES1VertexArray addObject:y4];
                  [GLES1VertexArray addObject:z4];
                  [GLES1VertexArray addObject:x4];
                  [GLES1VertexArray addObject:y4];
                  [GLES1VertexArray addObject:z4];
                  [GLES1VertexArray addObject:x2];
                  [GLES1VertexArray addObject:y2];
                  [GLES1VertexArray addObject:z2];
                  [GLES1VertexArray addObject:x3];
                  [GLES1VertexArray addObject:y3];
                  [GLES1VertexArray addObject:z3];
                  int count = 6 * kRGBA;
                  for (int i = 0; i < count; i++) {
                      NSNumber* color = [NSNumber numberWithFloat:1.0f];
                      [colorArray addObject:color];
                  }
                  vertexCount += 6;
              }
              if (3 == tmpUvArray.count) {
                  NSNumber* t1 = [tmpUvArray objectAtIndex:0];
                  NSNumber* t2 = [tmpUvArray objectAtIndex:1];
                  NSNumber* t3 = [tmpUvArray objectAtIndex:2];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  tidx1 *= 2;
                  tidx2 *= 2;
                  tidx3 *= 2;
                  NSNumber* u1 = [uvOriginArray objectAtIndex:tidx1];
                  NSNumber* v1 = [uvOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* u2 = [uvOriginArray objectAtIndex:tidx2];
                  NSNumber* v2 = [uvOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* u3 = [uvOriginArray objectAtIndex:tidx3];
                  NSNumber* v3 = [uvOriginArray objectAtIndex:tidx3 + 1];
                  GLfloat vf1 = 1.0f - [v1 floatValue];
                  GLfloat vf2 = 1.0f - [v2 floatValue];
                  GLfloat vf3 = 1.0f - [v3 floatValue];
                  v1 = [NSNumber numberWithFloat:vf1];
                  v2 = [NSNumber numberWithFloat:vf2];
                  v3 = [NSNumber numberWithFloat:vf3];
                  [uvArray addObject:u1];
                  [uvArray addObject:v1];
                  [uvArray addObject:u2];
                  [uvArray addObject:v2];
                  [uvArray addObject:u3];
                  [uvArray addObject:v3];
              } else if (4 == tmpUvArray.count) {
                  NSNumber* t1 = [tmpUvArray objectAtIndex:0];
                  NSNumber* t2 = [tmpUvArray objectAtIndex:1];
                  NSNumber* t3 = [tmpUvArray objectAtIndex:2];
                  NSNumber* t4 = [tmpUvArray objectAtIndex:3];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  int tidx4 = [t4 intValue] - 1;
                  tidx1 *= 2;
                  tidx2 *= 2;
                  tidx3 *= 2;
                  tidx4 *= 2;
                  NSNumber* u1 = [uvOriginArray objectAtIndex:tidx1];
                  NSNumber* v1 = [uvOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* u2 = [uvOriginArray objectAtIndex:tidx2];
                  NSNumber* v2 = [uvOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* u3 = [uvOriginArray objectAtIndex:tidx3];
                  NSNumber* v3 = [uvOriginArray objectAtIndex:tidx3 + 1];
                  NSNumber* u4 = [uvOriginArray objectAtIndex:tidx4];
                  NSNumber* v4 = [uvOriginArray objectAtIndex:tidx4 + 1];
                  GLfloat vf1 = 1.0f - [v1 floatValue];
                  GLfloat vf2 = 1.0f - [v2 floatValue];
                  GLfloat vf3 = 1.0f - [v3 floatValue];
                  GLfloat vf4 = 1.0f - [v4 floatValue];
                  v1 = [NSNumber numberWithFloat:vf1];
                  v2 = [NSNumber numberWithFloat:vf2];
                  v3 = [NSNumber numberWithFloat:vf3];
                  v4 = [NSNumber numberWithFloat:vf4];
                  [uvArray addObject:u1];
                  [uvArray addObject:v1];
                  [uvArray addObject:u2];
                  [uvArray addObject:v2];
                  [uvArray addObject:u4];
                  [uvArray addObject:v4];
                  [uvArray addObject:u4];
                  [uvArray addObject:v4];
                  [uvArray addObject:u2];
                  [uvArray addObject:v2];
                  [uvArray addObject:u3];
                  [uvArray addObject:v3];
              }
              if (3 == tmpNormalArray.count) {
                  NSNumber* t1 = [tmpNormalArray objectAtIndex:0];
                  NSNumber* t2 = [tmpNormalArray objectAtIndex:1];
                  NSNumber* t3 = [tmpNormalArray objectAtIndex:2];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  tidx1 *= 3;
                  tidx2 *= 3;
                  tidx3 *= 3;
                  NSNumber* x1 = [normalOriginArray objectAtIndex:tidx1];
                  NSNumber* y1 = [normalOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* z1 = [normalOriginArray objectAtIndex:tidx1 + 2];
                  NSNumber* x2 = [normalOriginArray objectAtIndex:tidx2];
                  NSNumber* y2 = [normalOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* z2 = [normalOriginArray objectAtIndex:tidx2 + 2];
                  NSNumber* x3 = [normalOriginArray objectAtIndex:tidx3];
                  NSNumber* y3 = [normalOriginArray objectAtIndex:tidx3 + 1];
                  NSNumber* z3 = [normalOriginArray objectAtIndex:tidx3 + 2];
                  [normalArray addObject:x1];
                  [normalArray addObject:y1];
                  [normalArray addObject:z1];
                  [normalArray addObject:x2];
                  [normalArray addObject:y2];
                  [normalArray addObject:z2];
                  [normalArray addObject:x3];
                  [normalArray addObject:y3];
                  [normalArray addObject:z3];
              } else if (4 == tmpNormalArray.count) {
                  NSNumber* t1 = [tmpNormalArray objectAtIndex:0];
                  NSNumber* t2 = [tmpNormalArray objectAtIndex:1];
                  NSNumber* t3 = [tmpNormalArray objectAtIndex:2];
                  NSNumber* t4 = [tmpNormalArray objectAtIndex:3];
                  int tidx1 = [t1 intValue] - 1;
                  int tidx2 = [t2 intValue] - 1;
                  int tidx3 = [t3 intValue] - 1;
                  int tidx4 = [t4 intValue] - 1;
                  tidx1 *= 3;
                  tidx2 *= 3;
                  tidx3 *= 3;
                  tidx4 *= 3;
                  NSNumber* x1 = [normalOriginArray objectAtIndex:tidx1];
                  NSNumber* y1 = [normalOriginArray objectAtIndex:tidx1 + 1];
                  NSNumber* z1 = [normalOriginArray objectAtIndex:tidx1 + 2];
                  NSNumber* x2 = [normalOriginArray objectAtIndex:tidx2];
                  NSNumber* y2 = [normalOriginArray objectAtIndex:tidx2 + 1];
                  NSNumber* z2 = [normalOriginArray objectAtIndex:tidx2 + 2];
                  NSNumber* x3 = [normalOriginArray objectAtIndex:tidx3];
                  NSNumber* y3 = [normalOriginArray objectAtIndex:tidx3 + 1];
                  NSNumber* z3 = [normalOriginArray objectAtIndex:tidx3 + 2];
                  NSNumber* x4 = [normalOriginArray objectAtIndex:tidx4];
                  NSNumber* y4 = [normalOriginArray objectAtIndex:tidx4 + 1];
                  NSNumber* z4 = [normalOriginArray objectAtIndex:tidx4 + 2];
                  [normalArray addObject:x1];
                  [normalArray addObject:y1];
                  [normalArray addObject:z1];
                  [normalArray addObject:x2];
                  [normalArray addObject:y2];
                  [normalArray addObject:z2];
                  [normalArray addObject:x4];
                  [normalArray addObject:y4];
                  [normalArray addObject:z4];
                  [normalArray addObject:x4];
                  [normalArray addObject:y4];
                  [normalArray addObject:z4];
                  [normalArray addObject:x2];
                  [normalArray addObject:y2];
                  [normalArray addObject:z2];
                  [normalArray addObject:x3];
                  [normalArray addObject:y3];
                  [normalArray addObject:z3];
              }
          }
      }
    }];
    [self addSubMesh:mesh GLES1VertexArray:GLES1VertexArray colorArray:colorArray normalArray:normalArray uvArray:uvArray vertexCount:vertexCount];
    return;
}
- (void)addSubMesh:(GLES1Mesh*)mesh GLES1VertexArray:(NSMutableArray*)vertexArray colorArray:(NSMutableArray*)colorArray normalArray:(NSMutableArray*)normalArray uvArray:(NSMutableArray*)uvArray vertexCount:(int)vertexCount {
    if (nil == mesh) {
        return;
    }
    GLES1VertexArray* vertex = [[GLES1VertexArray alloc] init:kDimension3D];
    [vertex setVertexCount:vertexCount];
    [vertex setVerticies:vertexArray];
    [vertex setColors:colorArray];
    [vertex setNormals:normalArray];
    [vertex setUVs:uvArray];
    [mesh setVertex:vertex];
    [mesh setRenderMode:GL_TRIANGLES];
    if (nil != self->_materials) {
        GLES1Material* material = [self->_materials objectForKey:mesh.useMaterial];
        if (nil != material) {
            [mesh setMaterial:material];
        }
    }
    [self.subMeshes addObject:mesh];
    return;
}
- (NSMutableArray<GLES1Mesh*>*)subMeshes {
    return self->_subMeshes;
}
@end
