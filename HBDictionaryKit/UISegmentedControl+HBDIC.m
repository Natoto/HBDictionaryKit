//
//  UISegmentedControl+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UISegmentedControl+HBDIC.h"
#import "UIControl+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIColor+HBKey.h"

@implementation UISegmentedControl(HBDIC)
 

//|items
//|imageItems
//|numberOfSegments //readonly
//|apportionsSegmentWidthsByContent
//|selectedSegmentIndex
//|tintColor
//|titleTextColor
//|selectedTitleTextColor

-(instancetype)configwithdictionary:(NSDictionary *)dictionary
{
    if (self && dictionary && [[dictionary class] isSubclassOfClass:[NSDictionary class]]) {
        [self configcontrolwithdictionary:dictionary];
        
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, apportionsSegmentWidthsByContent, self.apportionsSegmentWidthsByContent = apportionsSegmentWidthsByContent.boolValue);
        
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, items, if(items.length) {
            NSArray * itemsarray = [items textArrayFromString:items];
            [itemsarray enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self setTitle:obj forSegmentAtIndex:idx];
        }];})
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, imageItems, if(imageItems.length){
            NSArray * imgsarray = [imageItems textArrayFromString:imageItems];
            [imgsarray enumerateObjectsUsingBlock:^(NSString * imgname, NSUInteger idx, BOOL * _Nonnull stop) {
                [self setImage:[UIImage imageNamed:imgname] forSegmentAtIndex:idx];
            }];
        });
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, selectedSegmentIndex, self.selectedSegmentIndex = selectedSegmentIndex.integerValue);
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, tintColor, if(tintColor) self.tintColor = [UIColor colorWithHBKeyString:tintColor];)
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, titleTextColor, if(titleTextColor){
             [self setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHBKeyString:titleTextColor]} forState: UIControlStateNormal];
        })
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, selectedTitleTextColor, if(selectedTitleTextColor){
            [self setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHBKeyString:selectedTitleTextColor]} forState: UIControlStateSelected];
        })
        
    }
    return self;
}



@end
