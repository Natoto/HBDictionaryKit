//
//  UITextField+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UITextField+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIControl+HBDIC.h"
#import "UIColor+HBKey.h"

@implementation UITextField(HBDIC)

//|text
//|attributedText
//|textColor
//|font;
//|fontSize;
//|textAlignment
//|borderStyle
//|placeholder
//|clearsOnBeginEditing
//|adjustsFontSizeToFitWidth
//|minimumFontSize
//|background
//|disabledBackground
//|clearButtonMode
//|leftViewMode
//|rightViewMode

-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configcontrolwithdictionary:plistdic];
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, text, self.text = text)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSAttributedString, attributedText,if([[attributedText class] isSubclassOfClass:[NSAttributedString class]])  self.attributedText = attributedText)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textColor, if(textColor.length) self.textColor = [UIColor colorWithHBKeyString:textColor]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, UIFont, font, if([[font class] isSubclassOfClass:[UIFont class]]){ self.font = font;})
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, fontSize, if(fontSize.floatValue){ self.font = [UIFont systemFontOfSize:fontSize.floatValue]; })
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textAlignment, if(textAlignment.length){self.textAlignment = [self NSTextAlignmentFromString:textAlignment];})
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, borderStyle, if(borderStyle.length){
            self.borderStyle = [self UITextBorderStyleFromString:borderStyle];
        })
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, placeholder, self.placeholder = placeholder);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, clearsOnBeginEditing, self.clearsOnBeginEditing = clearsOnBeginEditing.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, adjustsFontSizeToFitWidth, self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, minimumFontSize, self.minimumFontSize = minimumFontSize.floatValue;)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, background, self.background = [UIImage imageNamed:background]);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, disabledBackground, self.disabledBackground = [UIImage imageNamed:disabledBackground])
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, clearButtonMode, if(clearButtonMode) self.clearButtonMode = [self UITextFieldViewModeFromString:clearButtonMode];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, leftViewMode, if(leftViewMode.length) self.leftViewMode = [self UITextFieldViewModeFromString:leftViewMode];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, rightViewMode, if(rightViewMode.length) self.rightViewMode = [self UITextFieldViewModeFromString:rightViewMode];)

    }
    return self;
}



@end
