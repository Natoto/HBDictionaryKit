//
//  UILabel+HBDIC.h
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+HBDIC.h"
@interface UILabel(HBDIC)

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
-(instancetype)configwithdictionary:(NSDictionary *)plistdic;
@end
