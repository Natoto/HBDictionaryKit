//
//  UILabel+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIColor+HBKey.h"
#import "UILabel+HBDIC.h"
#import <objc/runtime.h>
#import "NSObject+HBKey.h"
@implementation UILabel(HBDIC)


/**
 * 从字典赋值过来的 支持的属性 text
 font
 textColor
 shadowColor
 shadowOffset
 textAlignment
 lineBreakMode
 attributedText
 highlightedTextColor
 highlighted
 userInteractionEnabled
 enabled
 numberOfLines
 adjustsFontSizeToFitWidth
 baselineAdjustment
 minimumScaleFactor
 allowsDefaultTighteningForTruncation
 minimumFontSize
 adjustsLetterSpacingToFitWidth
 */
-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{

    NSLog(@"%s",__func__);
    if (self && plistdic) {
        [self configsuperwithdictionary:plistdic];
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, text, self.text = text)
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, fontsize,  self.font = [UIFont systemFontOfSize:fontsize.floatValue?fontsize.floatValue:15])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textColor,  self.textColor = [UIColor colorWithHBKeyString:textColor])
                
        DIC_FOR_OBJ_NOTNULL_(plistdic,NSString, shadowColor,\
                             self.shadowColor = [UIColor colorWithHBKeyString:shadowColor]);
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, shadowOffset, self.shadowOffset = CGSizeFromString(shadowOffset))
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textAlignment, self.textAlignment = [self NSTextAlignmentFromString:textAlignment])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, lineBreakMode, self.lineBreakMode = [self NSLineBreakModeFromString:lineBreakMode])
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, highlightedTextColor, self.highlightedTextColor = [UIColor colorWithHBKeyString:highlightedTextColor]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,highlighted , self.highlighted = highlighted.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,userInteractionEnabled , self.userInteractionEnabled = userInteractionEnabled.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,enabled , self.enabled = enabled.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,numberOfLines , self.numberOfLines = numberOfLines.integerValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,adjustsFontSizeToFitWidth , self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,baselineAdjustment , self.baselineAdjustment = baselineAdjustment.boolValue);
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,minimumScaleFactor , self.minimumScaleFactor = minimumScaleFactor.floatValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber ,allowsDefaultTighteningForTruncation , self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation.boolValue);
        
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSAttributedString , attributedText,
                             self.attributedText = attributedText;)
        
        //
    }
    return self;
}

#pragma mark -
//-(id)configWithDictionary:(NSDictionary *)dictionary
//{
//    if (self) {
//        for ( Class clazzType = [self class];; )
//        {
//            unsigned int		propertyCount = 0;
//            objc_property_t *	properties = class_copyPropertyList( clazzType, &propertyCount);
//            for ( NSUInteger i = 0; i < propertyCount; i++ )
//            {
//                const char *	name = property_getName(properties[i]);
//                NSString *		propertyName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//                if([propertyName description])
//                {
//                    @try {
//                        id object = [dictionary valueForKey:propertyName];
//                        if (object) {
//                            // 1 对其赋值 类型错误不挂掉
//                            [self setValue:object forKey:propertyName];
//                        }
//                    }
//                    @catch (NSException *exception) {
//                        // 2 捕获类型不匹配 赋值异常
//                        NSLog(@"😢-->%@ 类型不匹配 %s\n%@",propertyName, __FUNCTION__, exception);
//                    }
//                }
//            }
//            free( properties );
//            clazzType = class_getSuperclass( clazzType );
//            if ( nil == clazzType )
//                break;
//        }
//    }
//    return self;
//}
@end
