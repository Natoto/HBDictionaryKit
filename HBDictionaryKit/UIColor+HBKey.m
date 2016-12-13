//
//  UIColor+HBKey.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIColor+HBKey.h"

@implementation UIColor(HBKey)


//----------------------------------------------------------------- 颜色
#undef KT_HEXCOLORA
#define KT_HEXCOLORA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#undef KT_HEXCOLOR
#define KT_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]


+(UIColor *)colorWithHBKeyString:(NSString *)akey
{
    if (!akey || akey.length == 0) return nil;
    
    akey = [akey lowercaseString];
    NSArray * compants =[akey componentsSeparatedByString:@","];
    NSString * key = compants[0];
    NSString * alphastr = compants.count>1?compants[1]:@"1";
    float alpha = alphastr.floatValue;
    
    if ([key rangeOfString:@"0x"].location!= NSNotFound || [key rangeOfString:@"0X"].location!= NSNotFound) {
        //先以16为参数告诉strtoul字符串参数表示16进制数字，然后使用0x%X转为数字类型
        unsigned long red = strtoul([key UTF8String],0,16);
        NSLog(@"%s  %@ --> %lx",__FUNCTION__,key,red);
        UIColor * color = KT_HEXCOLORA(red,alpha);
        return color;
    }
    if ([key isEqualToString:@"random"]) {
        return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:alpha];
    }
    
    if ([key isEqualToString:uicolor_hbkey_blue]) {
        return  uicolor_forkey_(blue);
    }
    if ([key isEqualToString:@"darkgray"]) {
        return  uicolor_forkey_(darkGray);
    }
    if ([key isEqualToString:@"lightgray"]) {
        return  uicolor_forkey_(lightGray);
    }
    else if([key isEqualToString:uicolor_hbkey_white])
    {
        return uicolor_forkey_(white);
    }
    else if([key isEqualToString:uicolor_hbkey_gray])
    {
        return uicolor_forkey_(gray);
    }
    else if([key isEqualToString:uicolor_hbkey_red])
    {
        return uicolor_forkey_(red);
    }
    else if([key isEqualToString:uicolor_hbkey_green])
    {
        return uicolor_forkey_(green);
    }
    else if([key isEqualToString:uicolor_hbkey_blue])
    {
        return uicolor_forkey_(blue);
    }
    else if([key isEqualToString:uicolor_hbkey_cyan])
    {
        return uicolor_forkey_(cyan);
    }
    else if([key isEqualToString:uicolor_hbkey_yellow])
    {
        return uicolor_forkey_(yellow);
    }
    else if([key isEqualToString:uicolor_hbkey_magenta])
    {
        return uicolor_forkey_(magenta);
    }
    else if([key isEqualToString:uicolor_hbkey_orange])
    {
        return uicolor_forkey_(orange);
    }
    else if([key isEqualToString:uicolor_hbkey_purple])
    {
        return uicolor_forkey_(purple);
    }
    else if([key isEqualToString:uicolor_hbkey_brown])
    {
        return uicolor_forkey_(brown);
    }
    else if([key isEqualToString:uicolor_hbkey_clear])
    {
        return uicolor_forkey_(clear);
    }
    else if([key isEqualToString:uicolor_hbkey_black])
    {
        return uicolor_forkey_(black);
    }
    
    return nil;
}

@end
