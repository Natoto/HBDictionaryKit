//
//  UIControl+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIControl+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIView+HBDIC.h"

@implementation UIControl(HBDIC)

-(instancetype)configcontrolwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
       [self configsuperwithdictionary:plistdic];
        
       DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, enabled, self.enabled = enabled.boolValue)
       DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, selected, self.selected = selected;)
       DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, highlighted, self.highlighted = highlighted);
       DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, contentHorizontalAlignment, self.contentHorizontalAlignment = [self UIControlContentHorizontalAlignmentFromString:contentHorizontalAlignment];)
       DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, contentVerticalAlignment, self.contentVerticalAlignment = [self UIControlContentVerticalAlignmentFromString:contentVerticalAlignment];)
     
    }
    return self;
}

//typedef NS_ENUM(NSInteger, UIControlContentVerticalAlignment) {
//    UIControlContentVerticalAlignmentCenter  = 0,
//    UIControlContentVerticalAlignmentTop     = 1,
//    UIControlContentVerticalAlignmentBottom  = 2,
//    UIControlContentVerticalAlignmentFill    = 3,
//};

-(UIControlContentVerticalAlignment)UIControlContentVerticalAlignmentFromString:(NSString *)string
{
    UIControlContentVerticalAlignment alignment = UIControlContentVerticalAlignmentCenter;
    if ([string isInStrings:@"center",@"UIControlContentVerticalAlignmentCenter",NULL]) {
        alignment = UIControlContentVerticalAlignmentCenter;
    }
    else if([string isInStrings:@"top",@"UIControlContentVerticalAlignmentTop",NULL])
    {
        alignment = UIControlContentVerticalAlignmentTop;
    }
    else if ([string isInStrings:@"bottom",@"UIControlContentVerticalAlignmentBottom",NULL])
    {
        alignment = UIControlContentVerticalAlignmentBottom;
    }
    else if ([string isInStrings:@"fill",@"UIControlContentVerticalAlignmentFill",NULL]){
        alignment = UIControlContentVerticalAlignmentFill;
    }
    
    return alignment;
}

-(UIControlContentHorizontalAlignment)UIControlContentHorizontalAlignmentFromString:(NSString *)string
{
    UIControlContentHorizontalAlignment alignment = UIControlContentHorizontalAlignmentCenter;
    if ([string isInStrings:@"center",@"UIControlContentHorizontalAlignmentCenter",NULL]) {
        alignment = UIControlContentHorizontalAlignmentCenter;
    }
    else if([string isInStrings:@"left",@"UIControlContentHorizontalAlignmentLeft",NULL])
    {
        alignment = UIControlContentHorizontalAlignmentLeft;
    }
    else if ([string isInStrings:@"right",@"UIControlContentHorizontalAlignmentRight",NULL])
    {
        alignment = UIControlContentHorizontalAlignmentRight;
    }
    else if ([string isInStrings:@"fill",@"UIControlContentHorizontalAlignmentFill",NULL]){
        alignment = UIControlContentHorizontalAlignmentFill;
    }
    return alignment;
}
@end
