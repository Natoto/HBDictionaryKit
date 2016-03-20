//
//  UIColor+HBKey.m
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "UIColor+HBKey.h"

@implementation UIColor(HBKey)


//----------------------------------------------------------------- 颜色
#undef KT_HEXCOLORA
#define KT_HEXCOLORA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#undef KT_HEXCOLOR
#define KT_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]


+(UIColor *)colorWithHBKeyString:(NSString *)key
{
    if (!key || key.length == 0) return nil;
    
    key = [key lowercaseString];
    if ([key rangeOfString:@"0x"].location!= NSNotFound || [key rangeOfString:@"0X"].location!= NSNotFound) {
        //先以16为参数告诉strtoul字符串参数表示16进制数字，然后使用0x%X转为数字类型
        unsigned long red = strtoul([key UTF8String],0,16);
        NSLog(@"%s  %@ --> %lx",__FUNCTION__,key,red);
        UIColor * color = KT_HEXCOLOR(red);
        return color;
    }
    if ([key isEqualToString:@"random"]) {
        return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    }
    
    if ([key isEqualToString:value_cellstruct_blue]) {
        return  CELL_STRUCT_COLOR(blue);
    }
    if ([key isEqualToString:@"darkgray"]) {
        return  CELL_STRUCT_COLOR(darkGray);
    }
    if ([key isEqualToString:@"lightgray"]) {
        return  CELL_STRUCT_COLOR(lightGray);
    }
    else if([key isEqualToString:value_cellstruct_white])
    {
        return CELL_STRUCT_COLOR(white);
    }
    else if([key isEqualToString:value_cellstruct_gray])
    {
        return CELL_STRUCT_COLOR(gray);
    }
    else if([key isEqualToString:value_cellstruct_red])
    {
        return CELL_STRUCT_COLOR(red);
    }
    else if([key isEqualToString:value_cellstruct_green])
    {
        return CELL_STRUCT_COLOR(green);
    }
    else if([key isEqualToString:value_cellstruct_blue])
    {
        return CELL_STRUCT_COLOR(blue);
    }
    else if([key isEqualToString:value_cellstruct_cyan])
    {
        return CELL_STRUCT_COLOR(cyan);
    }
    else if([key isEqualToString:value_cellstruct_yellow])
    {
        return CELL_STRUCT_COLOR(yellow);
    }
    else if([key isEqualToString:value_cellstruct_magenta])
    {
        return CELL_STRUCT_COLOR(magenta);
    }
    else if([key isEqualToString:value_cellstruct_orange])
    {
        return CELL_STRUCT_COLOR(orange);
    }
    else if([key isEqualToString:value_cellstruct_purple])
    {
        return CELL_STRUCT_COLOR(purple);
    }
    else if([key isEqualToString:value_cellstruct_brown])
    {
        return CELL_STRUCT_COLOR(brown);
    }
    else if([key isEqualToString:value_cellstruct_clear])
    {
        return CELL_STRUCT_COLOR(clear);
    }
    else if([key isEqualToString:value_cellstruct_black])
    {
        return CELL_STRUCT_COLOR(black);
    }
    
    return nil;
}

@end
