// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef GLES1ObjAsset_h
#define GLES1ObjAsset_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLES1BaseAsset.h"
#import "GLES1Mesh.h"
@interface GLES1ObjAsset : GLES1BaseAsset {
    NSMutableArray<GLES1Mesh*>* _subMeshes;
    NSMutableDictionary<NSString*, GLES1Material*>* _materials;
}
@property(readonly) NSMutableArray<GLES1Mesh*>* subMeshes;
- (id)init;
@end
#endif /* GLES1ObjAsset_h */
