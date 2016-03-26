//
//  UITableView+HBDIC.m
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/26.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import "UITableView+HBDIC.h"
#import "UIScrollView+HBDIC.h"

@implementation  UITableView(HBDIC)

-(instancetype)configwithdictionary:(NSDictionary *)plistdic
{
    if (self && plistdic && [[plistdic class] isSubclassOfClass:[NSDictionary class]]) {
        [self configscrollviewwithdictionary:plistdic];
        
        
    }
    return self;
}
@end
