//
//  UIColor+HBKey.h
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import <UIKit/UIKit.h>

#undef CELL_STRUCT_COLOR
#define CELL_STRUCT_COLOR(COLORKEY) [UIColor  COLORKEY##Color]

static NSString * value_cellstruct_black = @"black";      // 0.0 white
static NSString * value_cellstruct_lightGray = @"lightgraycolor";  // 0.667 white
static NSString * value_cellstruct_white = @"white";//Color;      // 1.0 white
static NSString * value_cellstruct_gray = @"gray";//Color;       // 0.5 white
static NSString * value_cellstruct_clear = @"clear";

static NSString * value_cellstruct_red= @"red";//Color;        // 1.0, 0.0, 0.0 RGB
static NSString * value_cellstruct_green = @"green";//Color;      // 0.0, 1.0, 0.0 RGB
static NSString * value_cellstruct_blue=@"blue";// Color;       // 0.0, 0.0, 1.0 RGB
static NSString * value_cellstruct_cyan =@"cyan";// Color;       // 0.0, 1.0, 1.0 RGB
static NSString * value_cellstruct_yellow = @"yellow";// Color;     // 1.0, 1.0, 0.0 RGB
static NSString * value_cellstruct_magenta = @"magenta";//Color;    // 1.0, 0.0, 1.0 RGB
static NSString * value_cellstruct_orange = @"orange";//Color;     // 1.0, 0.5, 0.0 RGB
static NSString * value_cellstruct_purple = @"purple";//Color;     // 0.5, 0.0, 0.5 RGB
static NSString * value_cellstruct_brown = @"brown";//Color;      // 0.6, 0.4, 0.2 RGB

@interface UIColor(HBKey)
/**
 * 根据key关键字找到对应的颜色 black or  ox22ed
 */
+(UIColor *)colorWithHBKeyString:(NSString *)key;
@end
