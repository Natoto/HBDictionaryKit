//
//  UIViewController+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by zeno on 16/3/21.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import "UIViewController+HBDIC.h"
#import "UIView+HBDIC.h"
#import "UIColor+HBKey.h"

@implementation UIViewController(HBDIC)

-(instancetype)configwithdictionary:(NSDictionary *)dic
{
    if (self && dic && [[dic class] isSubclassOfClass:[NSDictionary class]]) {
  
        NSString * title = [dic objectForKey:@"title"];
        if (title && [[title class] isSubclassOfClass:[NSString class]]) {
            self.title = title;
        }
        NSString * backgroundcolor = [dic objectForKey:@"backgroundcolor"];
        if (backgroundcolor && [[backgroundcolor class] isSubclassOfClass:[NSString class]]) {
            self.view.backgroundColor = [UIColor colorWithHBKeyString:backgroundcolor];
        }
        NSString * backgroundimage  = [dic objectForKey:@"backgroundimage"];
        if (backgroundimage && [[backgroundimage class] isSubclassOfClass:[NSString class]]) {
            [self changeBackGroundWithBackImage:[UIImage imageNamed:backgroundimage]];
        }
    }
    return self;
}

-(void)changeBackGroundWithBackImage:(UIImage *)Image
{
    UIImageView * imageview = (UIImageView *)[self.view viewWithTag:2222];//
    if (!imageview) {
        imageview = [[UIImageView alloc] initWithImage:Image];
        imageview.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 20);
        [self.view addSubview:imageview];
        imageview.tag = 2222;
        [self.view sendSubviewToBack:imageview];
    }
    imageview.image = Image;
}
@end
