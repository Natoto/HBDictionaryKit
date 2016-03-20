//
//  UIView+HBDIC.h
//  UIDictionaryKitDemo
//
//  Created by BooB on 16/3/20.
//  Copyright © 2016年 BooB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(HBDIC)

-(instancetype)configsuperwithdictionary:(NSDictionary *)plistdic;
-(instancetype)configwithdictionary:(NSDictionary *)plistdic;



#pragma mark - boder
- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
#pragma mark - event
- (void)touchEndedBlock:(void (^)(UIView *selfView))block;

-(void)longPressEndedBlock:(void (^)(UIView *selfView))block;
@end
