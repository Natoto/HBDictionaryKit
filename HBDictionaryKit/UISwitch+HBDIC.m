//
//  UISwitch+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "NSObject+HBKey.h"
#import "UISwitch+HBDIC.h"
#import "UIControl+HBDIC.h"
#import "UIColor+HBKey.h"
@implementation UISwitch(HBDIC)

-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configcontrolwithdictionary:plistdic];
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, onTintColor, if(onTintColor.length) self.onTintColor = [UIColor colorWithHBKeyString:onTintColor];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, tintColor, if(tintColor.length) self.tintColor = [UIColor colorWithHBKeyString:tintColor]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, thumbTintColor, if(thumbTintColor.length) self.thumbTintColor = [UIColor colorWithHBKeyString:thumbTintColor];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, onImage, if(onImage) self.onImage = [UIImage imageNamed:onImage]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, offImage, if(offImage) self.offImage = [UIImage imageNamed:offImage]);
    }
    return self;
}

@end
