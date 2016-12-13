//
//  UITextView+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/26.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIScrollView+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIColor+HBKey.h"

@implementation  UITextView(HBDIC)

/*
 |font
 |fontsize
 |textColor
 |textAlignment
 |selectedRange
 |editable
 |selectable
 |dataDetectorTypes
 |allowsEditingTextAttributes
 |clearsOnInsertion
 |textContainerInset
 */

 -(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configscrollviewwithdictionary:plistdic];
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, fontsize, if(fontsize.floatValue) self.font = [UIFont systemFontOfSize:fontsize.floatValue]; )
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textColor, if(textColor.length) self.textColor = [UIColor colorWithHBKeyString:textColor];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textAlignment, self.textAlignment = [self NSTextAlignmentFromString:textAlignment];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, selectedRange, if(selectedRange.length) self.selectedRange = NSRangeFromString(selectedRange));
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, dataDetectorTypes, if(dataDetectorTypes) self.dataDetectorTypes = [self UIDataDetectorTypesFromString:dataDetectorTypes];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, allowsEditingTextAttributes, self.allowsEditingTextAttributes = allowsEditingTextAttributes.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, clearsOnInsertion, self.clearsOnInsertion = clearsOnInsertion.boolValue;)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, textContainerInset, if(textContainerInset.length) self.textContainerInset = UIEdgeInsetsFromString(textContainerInset))
    }
    return self;
}


@end
