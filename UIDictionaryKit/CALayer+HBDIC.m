//
//  CALayer+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "CALayer+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIColor+HBKey.h"

@implementation CALayer(HBDIC)


-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, maskToBounds, self.masksToBounds = maskToBounds.boolValue;);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, cornerRadius, self.cornerRadius = cornerRadius.floatValue;);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, borderWidth, self.borderWidth = borderWidth.floatValue;);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, borderColor, self.borderColor = [UIColor colorWithHBKeyString:borderColor].CGColor);
    }
    return self;
}
@end
