//
//  UIImageView+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIImageView+HBDIC.h"
#import "NSObject+HBKey.h"
#import "UIView+HBDIC.h"
#import "UIColor+HBKey.h"

@implementation UIImageView(HBDIC)

-(instancetype)configwithdictionary:(NSDictionary *)dictionary
{
    if (self && dictionary && [[dictionary class] isSubclassOfClass:[NSDictionary class]]) {
        [self configsuperwithdictionary:dictionary];
        
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, image, self.image = [UIImage imageNamed:image])
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, highlightedImage, self.highlightedImage = [UIImage imageNamed:highlightedImage])
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, userInteractionEnabled, self.userInteractionEnabled = userInteractionEnabled.boolValue)
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, highlighted, self.highlighted = highlighted.boolValue)
        //以,隔开的 如 img1，img2,img3
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, animationImages, if(animationImages.length) self.animationImages = [self animationImagesFromString:animationImages]);
        
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, highlightedAnimationImages, if(highlightedAnimationImages.length) self.highlightedAnimationImages = [self animationImagesFromString:highlightedAnimationImages]);
        
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, animationDuration, self.animationDuration = animationDuration.floatValue);
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSNumber, animationRepeatCount, self.animationRepeatCount = animationRepeatCount.integerValue);
        DIC_FOR_OBJ_NOTNULL_(dictionary, NSString, tintColor, self.tintColor = [UIColor colorWithHBKeyString:tintColor]);
        
        
    }
    return self;
}

-(NSArray *)animationImagesFromString:(NSString *)string
{
    NSArray * compantenames = [string componentsSeparatedByString:@","];
    NSMutableArray * images = [NSMutableArray new];
    [compantenames enumerateObjectsUsingBlock:^(NSString * imgname, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:imgname]];
    }];
    return images;
}
@end
