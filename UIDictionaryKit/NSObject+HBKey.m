//
//  Foundation+HBKey.m
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "NSObject+HBKey.h"
#import <UIKit/UIKit.h>

@implementation NSObject(HBKey)

 
-(NSLineBreakMode)NSLineBreakModeFromString:(NSString *)string
{
    string = [string lowercaseString];
    if ([string isInStrings:@"nslinebreakbywordwrapping", @"word", @"wordwrapping",NULL]) {
        return NSLineBreakByWordWrapping;
    }
    else if ([string isInStrings:@"charwrapping",@"nslinebreakbycharwrapping",@"char",NULL]) {
        return NSLineBreakByCharWrapping;
    }
    else if ([string isInStrings:@"clipping",@"clip",@"nslinebreakbyclipping",nil]) {
        return NSLineBreakByClipping;
    }
    else if ([string isInStrings:@"truncatinghead",@"head",nil]) {
        return NSLineBreakByTruncatingHead;
    }
    else if ([string isInStrings:@"truncatingmiddle",@"nslinebreadbytruncatingmiddle",@"middle",nil]) {
        return NSLineBreakByTruncatingMiddle;
    }
    else if ([string isInStrings:@"truncatingtail",@"tail",@"nslinebreakbytruncatingtail",NULL]) {
        return NSLineBreakByTruncatingTail;
    }
    return NSLineBreakByWordWrapping;
}

-(NSTextAlignment )NSTextAlignmentFromString:(NSString *)string
{
    string = [string lowercaseString];
    if ([string isEqualToString:@"center"]) {
        return NSTextAlignmentCenter;
    }
    else if([string isEqualToString:@"left"])
    {
        return NSTextAlignmentLeft;
    }
    else if([string isEqualToString:@"right"])
    {
        return NSTextAlignmentRight;
    }
    else if([string isEqualToString:@"justified"])
    {
        return NSTextAlignmentJustified;
    }
    else if([string isEqualToString:@"natural"])
    {
        return NSTextAlignmentNatural;
    }
    return NSTextAlignmentLeft;
}


//typedef NS_ENUM(NSInteger, UITextBorderStyle) {
//    UITextBorderStyleNone,
//    UITextBorderStyleLine,
//    UITextBorderStyleBezel,
//    UITextBorderStyleRoundedRect
//};

-(UITextBorderStyle)UITextBorderStyleFromString:(NSString *)string
{
    string = [string lowercaseString];
    UITextBorderStyle borderstyle = UITextBorderStyleNone;
    if ([string isInStrings:@"none",@"uitextborderstylenone",NULL]) {
        borderstyle = UITextBorderStyleNone;
    }
    else if([string isInStrings:@"line",@"uitextborderstyleline",NULL])
    {
        borderstyle = UITextBorderStyleLine;
    }
    else if([string isInStrings:@"bezel",@"uitextborderstylebezel",NULL])
    {
        borderstyle = UITextBorderStyleBezel;
    }
    else if([string isInStrings:@"rect",@"rounded",@"roundedrect",@"uitextborderstyleroundedrect",NULL])
    {
        borderstyle = UITextBorderStyleRoundedRect;
    }
    return borderstyle;
}

//typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
//    UITextFieldViewModeNever,
//    UITextFieldViewModeWhileEditing,
//    UITextFieldViewModeUnlessEditing,
//    UITextFieldViewModeAlways
//};

-(UITextFieldViewMode)UITextFieldViewModeFromString:(NSString *)string
{
    string = [string lowercaseString];
    UITextFieldViewMode mode = UITextFieldViewModeNever;
    if ([string isInStrings:@"none",@"never",@"uitextfieldviewmodenever",NULL]) {
        mode = UITextFieldViewModeNever;
    }
    else if([string isInStrings:@"while",@"whileediting",@"uitextfieldviewmodewhileediting",NULL]){
        mode = UITextFieldViewModeWhileEditing;
    }
    else if([string isInStrings:@"unless",@"unlessediting",@"uitextfieldviewmodeunlessediting",NULL]){
        mode = UITextFieldViewModeUnlessEditing;
    }
    else if([string isInStrings:@"always",@"uitextfieldviewmodewhileediting",NULL]){
        mode = UITextFieldViewModeAlways;
    }
    return mode;
}

@end

@implementation  NSString(HBKey)

/**
 * 字符串是否存在下面的字符串中 注意：赋值时已null结尾
 */
-(BOOL)isInStrings:(NSString *)s1, ...
{
    BOOL valiate = NO;
    va_list list;
    va_start(list, s1);
    BOOL isequ0 = [self isEqualToString:s1];
    if (isequ0) {
        valiate = YES;
    }
    NSString * otherstring;
    while ((otherstring = va_arg(list, NSString *))) {
        if ([otherstring isKindOfClass:[NSString class]])
        {
            BOOL isequ = [self isEqualToString:otherstring];
            if (isequ) {
                valiate = YES;
            }
        }
    }
    va_end(list);
    return valiate;
}
//item1,item2,item3,item4
-(NSArray *)textArrayFromString:(NSString *)string
{
    NSArray * compantenames = [string componentsSeparatedByString:@","];
    NSMutableArray * images = [NSMutableArray new];
    [compantenames enumerateObjectsUsingBlock:^(NSString * imgname, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:imgname];
    }];
    return images;
}
 

@end
