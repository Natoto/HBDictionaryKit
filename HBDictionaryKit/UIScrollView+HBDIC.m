//
//  UIScrollView+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/26.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIScrollView+HBDIC.h"
#import "UIView+HBDIC.h"
#import "NSObject+HBKey.h" 

@implementation  UIScrollView(HBDIC)

/**
 |contentOffset
 |contentSize
 |contentInset
 |directionalLockEnabled
 |bounces
 |alwaysBounceVertical
 |alwaysBounceHorizontal
 |pagingEnabled
 |scrollEnabled
 |showsHorizontalScrollIndicator
 |showsVerticalScrollIndicator
 |scrollIndicatorInsets
 |indicatorStyle
 |decelerationRate
 |minimumZoomScale
 |maximumZoomScale
 |zoomScale
 */

-(instancetype)configscrollviewwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configsuperwithdictionary:plistdic];
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, contentOffset, if(contentOffset.length) self.contentOffset = CGPointFromString(contentOffset);)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, contentSize, if(contentSize.length) self.contentSize = CGSizeFromString(contentSize));
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, contentInset, if(contentInset.length) self.contentInset = UIEdgeInsetsFromString(contentInset));
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, directionalLockEnabled, self.directionalLockEnabled = directionalLockEnabled.boolValue)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, bounces, self.bounces = bounces.boolValue;)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, alwaysBounceVertical, self.alwaysBounceVertical = alwaysBounceVertical.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, alwaysBounceHorizontal,self.alwaysBounceHorizontal = alwaysBounceHorizontal.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, pagingEnabled, self.pagingEnabled = pagingEnabled.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, scrollEnabled, self.scrollEnabled = scrollEnabled.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, showsHorizontalScrollIndicator, self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator.boolValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, showsVerticalScrollIndicator, self.showsVerticalScrollIndicator = showsVerticalScrollIndicator.boolValue;)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, scrollIndicatorInsets, if(scrollIndicatorInsets.length) self.scrollIndicatorInsets = UIEdgeInsetsFromString(scrollIndicatorInsets);)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSString, indicatorStyle, if(indicatorStyle.length) self.indicatorStyle = [self UIScrollViewIndicatorStyleFromString:indicatorStyle];)
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, decelerationRate, self.decelerationRate = decelerationRate.floatValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, minimumZoomScale, self.minimumZoomScale = minimumZoomScale.floatValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, maximumZoomScale, self.maximumZoomScale = maximumZoomScale.floatValue);
        DIC_FOR_OBJ_NOTNULL_(plistdic, NSNumber, zoomScale, self.zoomScale = zoomScale.floatValue);
        
    }
    return self;
}


@end
