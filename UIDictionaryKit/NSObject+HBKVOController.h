/**
  Copyright (c) 2014-present, Facebook, Inc.
  All rights reserved.

  This source code is licensed under the BSD-style license found in the
  LICENSE file in the root directory of this source tree. An additional grant
  of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>
#import "HBKVOController.h"

@interface NSObject (HBKVOController)

/**
 @abstract Lazy-loaded HBKVOController for use with any object
 @return HBKVOController associated with this object, creating one if necessary
 @discussion This makes it convenient to simply create and forget a HBKVOController, and when this object gets dealloc'd, so will the associated controller and the observation info.
 */
@property (nonatomic, strong) HBKVOController *KVOController;
@property (nonatomic, strong) HBKVOController *KVOControllerNonRetaining;

@end
