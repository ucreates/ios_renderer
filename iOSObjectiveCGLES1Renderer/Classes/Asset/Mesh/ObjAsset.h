// ======================================================================
// Project Name    : ios_renderer
//
// Copyright © 2020 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
#ifndef ObjAsset_h
#define ObjAsset_h
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "BaseAsset.h"
#import "Mesh.h"
@interface ObjAsset : BaseAsset {
    NSMutableArray<Mesh*>* _subMeshes;
    NSMutableDictionary<NSString*, Material*>* _materials;
}
@property(readonly) NSMutableArray<Mesh*>* subMeshes;
- (id)init;
@end
#endif /* ObjAsset_h */
