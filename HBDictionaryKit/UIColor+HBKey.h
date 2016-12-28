//
//  UIColor+HBKey.h
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

#undef uicolor_forkey_
#define uicolor_forkey_(COLORKEY) [UIColor  COLORKEY##Color]

static NSString * uicolor_hbkey_black = @"black";      // 0.0 white
static NSString * uicolor_hbkey_lightGray = @"lightgraycolor";  // 0.667 white
static NSString * uicolor_hbkey_white = @"white";//Color;      // 1.0 white
static NSString * uicolor_hbkey_gray = @"gray";//Color;       // 0.5 white
static NSString * uicolor_hbkey_clear = @"clear";

static NSString * uicolor_hbkey_red= @"red";//Color;        // 1.0, 0.0, 0.0 RGB
static NSString * uicolor_hbkey_green = @"green";//Color;      // 0.0, 1.0, 0.0 RGB
static NSString * uicolor_hbkey_blue=@"blue";// Color;       // 0.0, 0.0, 1.0 RGB
static NSString * uicolor_hbkey_cyan =@"cyan";// Color;       // 0.0, 1.0, 1.0 RGB
static NSString * uicolor_hbkey_yellow = @"yellow";// Color;     // 1.0, 1.0, 0.0 RGB
static NSString * uicolor_hbkey_magenta = @"magenta";//Color;    // 1.0, 0.0, 1.0 RGB
static NSString * uicolor_hbkey_orange = @"orange";//Color;     // 1.0, 0.5, 0.0 RGB
static NSString * uicolor_hbkey_purple = @"purple";//Color;     // 0.5, 0.0, 0.5 RGB
static NSString * uicolor_hbkey_brown = @"brown";//Color;      // 0.6, 0.4, 0.2 RGB

@interface UIColor(HBKey)
/**
 * 根据key关键字找到对应的颜色 black or  ox22ed
 */
+(UIColor *)colorWithHBKeyString:(NSString *)key;
@end
