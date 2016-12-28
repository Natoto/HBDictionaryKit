//
//  UIView+HBDIC.h
//  UIDictionaryKitDemo
//
//  Created by Natoto on 16/3/20.
//  Copyright © 2016年 YY.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(HBDIC)

//仅用于设置uiview类
-(instancetype)configsuperwithdictionary:(NSDictionary *)plistdic;

/**
 * 用字典设置基于UIView类的基本属性
 */
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
